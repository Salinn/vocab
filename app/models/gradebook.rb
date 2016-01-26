class Gradebook
  def self.course_grades(answers, course)
    user_lesson_module_grades = Hash.new([0,0])
    total_grade_and_time = Hash.new([0,0])
    answers.each do |answer|
      total_correct, total_time = user_lesson_module_grades["#{answer['user_id']}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"]
      user_lesson_module_grades["#{answer['user_id']}.#{answer['lesson_id']}.#{answer['lesson_module_id']}"] = [(total_correct + answer['correct']), (total_time + answer['time_to_complete'])]
    end
    course.lessons.each do |lesson|
      lesson.lesson_modules.each do |lesson_module|
        User.with_role(:student, course).each do |user|
          total_correct, total_time = total_grade_and_time["#{user.id}.#{lesson_module.id}"]
          user_lesson_module_grades["#{user.id}.#{lesson.id}.#{lesson_module.id}"] =[((total_correct.fdiv(lesson_module.questions.length))*100).to_i, total_time]
        end
      end
    end
    user_lesson_module_grades.each do |k, v|
      key_split = k.split('.')
      total_grade, total_time = total_grade_and_time["#{key_split[0]}.#{key_split[1]}"]
      total_grade_and_time["#{key_split[0]}.#{key_split[1]}"] = [total_grade+v[0],total_time+v[1]]
    end
    total_grade_and_time
  end

  def self.lesson_grades(user, lesson_module)
    answers = lesson_model_grades(user, lesson_module.question_ids)
    lesson_module_answers = sort_answer_info(answers)
    total_correct, total_time = get_total_grade_and_time(lesson_module_answers)
    total_correct_percent = ((total_correct.fdiv(lesson_module.questions.length))*100).to_i
    [total_correct_percent, total_time]
  end

  def self.course_lesson_grades(user, lesson_module)
    answers = lesson_model_grades(user, lesson_module.question_ids)
    lesson_module_answers = sort_answer_info(answers)
    total_correct, total_time = get_total_grade_and_time(lesson_module_answers)
    [total_correct, lesson_module.questions.length, total_time]
  end

  def self.sort_answer_info(answers)
    lesson_module_grade_and_time = []
    answers.each do |answer|
      correct = 0
      time = 0
      correct += answer.correct ? 1 : 0
      time += answer.time_to_complete
      lesson_module_grade_and_time.push([correct, time])
    end
    lesson_module_grade_and_time
  end

  def self.get_total_grade_and_time(lesson_module_answers)
    total_correct, total_time = [0, 0]
    lesson_module_answers.each do |answer|
      total_correct += answer.first
      total_time += answer.last
    end
    [total_correct, total_time]
  end

  def self.lesson_model_grade(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end

  def self.lesson_model_grades(user, questions)
    Answer.where(user_id: user.id, question_id: questions)
  end
end