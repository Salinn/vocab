class Gradebook
  def self.course_grades(answers, users, course)
    course_grades = Hash.new([0,0])
    total_grade_and_time = Hash.new([0,0])
    answers.each do |answer|
      total_correct, total_time = course_grades["#{answer['user_id']}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"]
      course_grades["#{answer['user_id']}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"] = [(total_correct + answer['correct']), (total_time + answer['time_to_complete'])]
    end
    course.lessons.each do |lesson|
      lesson.lesson_modules.each do |lesson_module|
        users.each do |user|
          total_correct, total_time = course_grades["#{user.id}.#{lesson.id}.#{lesson_module.id}"]
          course_grades["#{user.id}.#{lesson.id}.#{lesson_module.id}"] = calculate_lesson_grade(total_correct, total_time, lesson_module)
        end
      end
    end
    course_grades.each do |k, v|
      key_split = k.split('.')
      total_grade, total_time = total_grade_and_time["#{key_split[0]}.#{key_split[1]}"]
      final_grade, final_time = total_grade_and_time["#{key_split[0]}"]
      total_grade_and_time["#{key_split[0]}.#{key_split[1]}"] = [total_grade+v[0],total_time+v[1]]
      total_grade_and_time["#{key_split[0]}"] = [final_grade+v[0], final_time+v[1]]
    end
    users.each do |user|
      final_grade, final_time = total_grade_and_time["#{user.id}"]
      total_grade_and_time["#{user.id}"] = [final_grade.fdiv(course.lessons.length).round(2), final_time]
    end
    total_grade_and_time
  end

  def self.calculate_lesson_grade(total_correct, total_time, lesson_module)
    [((total_correct.fdiv(lesson_module.questions.length))*lesson_module.value_percentage).round(2), total_time]
  end

  def self.calculate_lesson_module_grade(total_correct, total_time, lesson_module)
    [((total_correct.fdiv(lesson_module.questions.length))*100).round(2), total_time]
  end

  def self.calculate_question_grade(total_correct)
    (total_correct == 1) ? 100 : 0
  end

  def self.lesson_grades(answers, users, lesson)
    lesson_grades = Hash.new([0,0])
    total_grade_and_time = Hash.new([0,0])
    answers.each do |answer|
      total_correct, total_time = lesson_grades["#{answer['user_id']}.#{answer['lesson_module_id']}"]
      lesson_grades["#{answer['user_id']}.#{answer['lesson_module_id']}"] = [(total_correct + answer['correct']), (total_time + answer['time_to_complete'])]
    end

    lesson.lesson_modules.each do |lesson_module|
      users.each do |user|
        total_correct, total_time = lesson_grades["#{user.id}.#{lesson_module.id}"]
        lesson_module_grade, lesson_current_time = calculate_lesson_grade(total_correct, total_time, lesson_module)
        final_grade, final_time = total_grade_and_time["#{user.id}"]
        total_grade_and_time["#{user.id}.#{lesson_module.id}"] = calculate_lesson_module_grade(total_correct, total_time, lesson_module)
        total_grade_and_time["#{user.id}"] = [(final_grade+lesson_module_grade),(final_time+lesson_current_time)]
      end
    end
    total_grade_and_time
  end

  def self.lesson_module_grades(answers, users, lesson_module)
    lesson_module_grades = Hash.new([0,[],0,[]])
    answers.each do |answer|
      total_correct, total_time, number_of_attempts, choices = lesson_module_grades["#{answer['user_id']}.#{answer['question_id']}"]
      lesson_module_grades["#{answer['user_id']}.#{answer['question_id']}"] = [(total_correct + answer['correct']), (total_time.push(answer['time_to_complete'])), (number_of_attempts+1), choices.push('X')]
    end

    lesson_module.questions.each do |question|
      users.each do |user|
        total_correct, total_time, number_of_attempts, choices = lesson_module_grades["#{user.id}.#{question.id}"]
        lesson_module_grades["#{user.id}.#{lesson_module.id}.#{question.id}"] = [calculate_question_grade(total_correct),(total_time.sum)]
      end
    end
    lesson_module_grades
  end
end