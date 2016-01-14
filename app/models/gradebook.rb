class Gradebook
  def self.course_grades(user, lesson)
    total_correct = 0
    total_questions = 0
    total_time = 0

    lesson.lesson_modules.each do |lesson_module|
      lesson_modules_correct, lesson_modules_question_total, lesson_modules_time = course_lesson_grades(user, lesson_module)
      total_correct += lesson_modules_correct
      total_questions += lesson_modules_question_total
      total_time += lesson_modules_time
    end
    total_correct_percent = ((total_correct.fdiv(total_questions))*100).to_i
    [total_correct_percent, total_time]
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