class Gradebook
  def self.course_grades(users, course)
    users_length = users.length
    grades = Hash.new([0,0])
    Grade.includes(:lesson).where("user_id IN (?) AND (course_id =? OR lesson_id IN (?))", users.pluck(:id), course.id, course.lessons.pluck(:id)).each do |grade|
      if grade.lesson.nil?
        user_course_grade, user_course_time = grades["user_course_#{grade.user_id}"]
        grades["user_course_#{grade.user_id}"] = [(user_course_grade+grade.grade), (user_course_time+grade.time)]

        average_course_grade, average_course_time = grades['course_average']
        grades['course_average'] = [(average_course_grade+grade.grade),(average_course_time+grade.time)]
      else
        lesson_grade, lesson_time = grades["lesson_average#{grade.lesson.id}"]
        grades["lesson_average#{grade.lesson.id}"] = [(lesson_grade+grade.grade),(lesson_time+grade.time)]
        grades["#{grade.user_id}-#{grade.lesson_id}"] = [grade.grade, grade.time]
      end
    end
    course.lessons.each do |lesson|
      lesson_average_grade, lesson_average_time = grades["lesson_average#{lesson.id}"]
      grades["lesson_average#{lesson.id}"] = [((lesson_average_grade.fdiv(users_length)).to_i),((lesson_average_time.fdiv(users_length)).to_i)]
    end
    final_grade, final_time = grades['course_average']
    grades['course_average'] = [((final_grade.fdiv(users_length)).to_i),((final_time.fdiv(users_length)).to_i)]
    grades
  end

  def self.lesson_grades(answers, users, lesson)
    #Creates 1 hashes that will always start with an empty array oy 0,0
    #lesson_grades will become the size of students + students * lesson_modules and will figure out the points per lesson_module
    lesson_grades = Hash.new([0,0])
    answers.each do |answer|
      total_correct, total_time = lesson_grades["#{answer['user_id']}.#{answer['lesson_module_id']}"]
      lesson_grades["#{answer['user_id']}.#{answer['lesson_module_id']}"] = [(total_correct + answer['correct']), (total_time + answer['time_to_complete'])]
    end

    #sets the final grade and time for each lesson and lesson_module
    lesson.lesson_modules.each do |lesson_module|
      users.each do |user|
        #Gets the basic information for the lesson and lesson_modules for final grades
        total_correct, total_time = lesson_grades["#{user.id}.#{lesson_module.id}"]
        final_grade, final_time = lesson_grades["#{user.id}"]
        lesson_module_grade_total, lesson_module_time_total = lesson_grades["Lesson Module #{lesson_module.id}"]
        final_average_grade, final_average_time = lesson_grades["Lesson #{lesson.id}"]

        #Calculates the grades for the lesson total and the lesson_module totals
        lesson_module_grade, lesson_module_time = calculate_lesson_module_grade(total_correct, total_time, lesson_module)
        lesson_grade, lesson_time = calculate_lesson_grade(total_correct, total_time, lesson_module)

        #Sets the grade and time for each lesson_module and the final lesson grade overall
        lesson_grades["#{user.id}.#{lesson_module.id}"] = [lesson_module_grade, lesson_module_time]
        lesson_grades["#{user.id}"] = [(final_grade+lesson_grade),(final_time+lesson_time)]
        lesson_grades["Lesson Module #{lesson_module.id}"] = [(lesson_module_grade_total+lesson_module_grade), (lesson_module_time_total+lesson_module_time)]
        lesson_grades["Lesson #{lesson.id}"] = [(final_average_grade+lesson_grade),(final_average_time+lesson_time)]
      end
      lesson_module_grade_total, lesson_module_time_total = lesson_grades["Lesson Module #{lesson_module.id}"]

      lesson_grades["Lesson Module #{lesson_module.id}"] = [('%.2f' % lesson_module_grade_total.fdiv(users.length)), ('%.0f' % lesson_module_time_total.fdiv(users.length))]
    end
    final_students_grade, final_students_time = lesson_grades["Lesson #{lesson.id}"]
    lesson_grades["Lesson #{lesson.id}"] = [('%.2f' % final_students_grade.fdiv(users.length)), ('%.0f' % final_students_time.fdiv(users.length))]


    #Returns hash with the user's final lesson grade/time and grade/time for each lesson_module
    lesson_grades
  end

  def self.lesson_module_grades(answers, users, lesson_module)
    #Creates 1 hashes that will always start with an empty array oy 0,0
    #lesson_module_grades will become the size of students + students * question * lesson_module.attempts and will figure out the points per question
    lesson_module_grades = Hash.new{ |h, k| h[k] = [] }

    #This iterates over all of the answers queried and condenses them in the hash by inserting by the user.id,
    #  question.id to create a unqiue value for all of the answers belonging to those 2 unique values.
    #There can be multiple answers for the above for the number of total course questions * lesson_module.attempt.
    #  That is why it adds for each iteration instead of inserting.
    answers.each do |answer|
      student_answers = lesson_module_grades["#{answer['user_id']}.#{answer['question_id']}"]
      if student_answers.empty?
        student_answers[0] = answer['correct']
        student_answers[1] = answer['time_to_complete']
      else
        student_answers[0] = (student_answers[0] + answer['correct'])
        student_answers[1] = (student_answers[1] + answer['time_to_complete'])
      end
      student_answers.push(answer['answer_option_id'])
      student_answers.push(answer['correct'])
      student_answers.push(answer['time_to_complete'])
      lesson_module_grades["#{answer['user_id']}.#{answer['question_id']}"] = student_answers
    end

    lesson_module.questions.each do |question|
      users.each do |user|
        student_answers = lesson_module_grades["#{user.id}.#{question.id}"]
        total_correct = student_answers.shift
        student_answers.unshift(calculate_question_grade(total_correct))
        lesson_module_grades["#{user.id}.#{question.id}"] = student_answers

        grade, time = student_answers.shift(2)
        answer_options = question.answer_options.pluck(:id)
        (0...student_answers.length).each do |index|
          next if(index % 3 != 0)
          student_answers[index] = determine_choice(student_answers[index], answer_options)
        end
        student_answers.unshift(time)
        student_answers.unshift(grade)
        lesson_module_grades["#{user.id}.#{question}"] = student_answers
      end
    end

    lesson_module_grades
  end

  def self.student_grades(answers, course)
    student_grades = Hash.new([0,0])
    user_answers = Hash.new{ |h, k| h[k] = [] }

    answers.each do |answer|
      student_answers = user_answers["#{answer['question_id']}"]
      student_answers.push(answer['answer_option_id'])
      student_answers.push(answer['correct'])
      student_answers.push(answer['time_to_complete'])
      user_answers["#{answer['question_id']}"] = student_answers

      grade, time = student_grades["#{course.id}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"]
      question_grade, question_time = student_grades["#{course.id}.#{answer['lesson_id']}.#{answer['lesson_module_id']}.#{answer['question_id']}"]
      student_grades["#{course.id}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"] = [(grade + answer['correct']), (time + answer['time_to_complete'])]
      student_grades["#{course.id}.#{answer['lesson_id']}.#{answer['lesson_module_id']}.#{answer['question_id']}"] = [calculate_question_grade(question_grade + answer['correct']), (question_time + answer['time_to_complete'])]
    end

    course.lessons.each do |lesson|
      lesson.lesson_modules.each do |lesson_module|
        lesson_grade, lesson_time = student_grades["#{course.id}.#{lesson.id}"]
        lesson_module_grade, lesson_module_time = student_grades["#{course.id}.#{lesson.id}.#{lesson_module.id}"]
        module_grade, module_time = calculate_lesson_module_grade(lesson_module_grade, lesson_module_time, lesson_module)
        calculated_lesson_grade, calculated_lesson_time = calculate_student_lesson_grade(module_grade, module_time, lesson_module)

        student_grades["#{course.id}.#{lesson.id}.#{lesson_module.id}"] = [module_grade, module_time]
        student_grades["#{course.id}.#{lesson.id}"] = [lesson_grade + calculated_lesson_grade, lesson_time + calculated_lesson_time ]
        lesson_module.questions.each do |question|
          answer_options = question.answer_options.pluck(:id)
          student_answers = user_answers["#{question.id}"]
          (0...student_answers.length).each do |index|
            next if(index % 3 != 0)
            student_answers[index] = determine_choice(student_answers[index], answer_options)
          end
          user_answers["#{question}"] = student_answers
        end
      end
      course_grade, course_time = student_grades["#{course.id}"]
      lesson_grade, lesson_time = student_grades["#{course.id}.#{lesson.id}"]
      student_grades["#{course.id}"] = [course_grade + lesson_grade, course_time + lesson_time]
    end
    course_grade, course_time = student_grades["#{course.id}"]
    student_grades["#{course.id}"] = [('%.2f' % course_grade.fdiv(course.lessons.length)).to_i, course_time]

    [student_grades, user_answers]
  end


  #Calculates a lesson total grade with only 2 digits after the decimal place
  def self.calculate_lesson_grade(total_correct, total_time, lesson_module)
    [('%.2f' % ((total_correct.fdiv(lesson_module.questions.length))*lesson_module.value_percentage)).to_i, total_time]
  end

  def self.calculate_student_lesson_grade(total_correct, total_time, lesson_module)
    [('%.2f' % (total_correct*(lesson_module.value_percentage.fdiv(100)))).to_i, total_time]
  end

  #Calculates a lesson_module total grade with only 2 digits after the decimal place
  def self.calculate_lesson_module_grade(total_correct, total_time, lesson_module)
    [('%.2f' % ((total_correct.fdiv(lesson_module.questions.length))*100)).to_i, total_time]
  end

  #Determines if a user got the question correct
  #To be correct there should be 1 answer correct
  #If it is wrong then the incoming number should be a 0
  def self.calculate_question_grade(total_correct)
    (total_correct == 1) ? 100 : 0
  end

  def self.determine_choice(student_answer, answer_options)
    letters = %W[A B C D E F G H I J K L M N O P Q R S T U V W Y X Z]
    answer_options.each_with_index do |answer_option, index|
      return letters[index] if answer_option == student_answer
    end
  end
end