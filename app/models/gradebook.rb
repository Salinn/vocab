class Gradebook
  def self.course_grades(user, lesson)
    total_correct = 0
    total_questions = 0
    total_time = 0

    lesson.lesson_modules.each do |lesson_module|
      lesson_modules_correct, lesson_modules_question_total, lesson_modules_time = lesson_grades_raw(user, lesson_module)
      total_correct += lesson_modules_correct
      total_questions += lesson_modules_question_total
      total_time += lesson_modules_time
    end
    total_correct_percent = ((total_correct.fdiv(total_questions))*100).to_i
    [total_correct_percent, total_time]
  end

  def self.lesson_grades(user, lesson_module)
    student_info = []
    correct = 0
    time = 0
    total_correct = 0
    total_time = 0
    answers = lesson_model_last_grade(user, lesson_module.question_ids)
    answers.each do |answer|
      correct += answer.correct ? 1 : 0
      time += answer.time_to_complete
      student_info.push([correct, time])
      correct = 0
      time = 0
    end
    student_info.each do |answer|
      total_correct += answer.first
      total_time += answer.last
    end
    total_correct_percent = ((total_correct.fdiv(lesson_module.questions.length))*100).to_i
    [total_correct_percent, total_time]
  end

  def self.lesson_grades_raw(user, lesson_module)
    total_correct = 0
    total_time = 0
    lesson_module.questions.each do |question|
      answer = lesson_model_last_grade(user, question)
      total_correct += 1 if answer.correct
      total_time += answer.time_to_complete
    end
    [total_correct, lesson_module.questions.length, total_time]
  end

  def self.lesson_model_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end

  def self.lesson_model_last_grade(user, questions)
    Answer.where(user_id: user.id, question_id: questions)
  end
end



=begin
  "select * from info WHERE `question_id` IN ('1,2,3,4,5')"
  sql = "SELECT * FROM answers WHERE `id` IN (#{questions.map{|x| x.id}.join(', ')})"
  @connection = ActiveRecord::Base.connection
  @connection.exec_query(sql)
=end