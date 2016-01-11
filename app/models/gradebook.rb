class Gradebook
  def self.course_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end

  def self.lesson_grades(user, lesson_module)
    total_correct = 0
    total_time = 0
    lesson_module.questions.each do |question|
      answer = lesson_model_last_grade(user, question)
      total_correct += 1 if answer.correct
      total_time += answer.time_to_complete
    end
    total_correct_percent = ((total_correct.fdiv(lesson_module.questions.length))*100).to_i 
    [total_correct_percent, total_time]
  end


  def self.lesson_model_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end

  def self.lesson_model_last_grade(user, question)
    Answer.where(user_id: user.id, question_id: question.id).last
  end
end



=begin
  "select * from info WHERE `question_id` IN ('1,2,3,4,5')"
  sql = "SELECT * FROM answers WHERE `id` IN (#{questions.map{|x| x.id}.join(', ')})"
  @connection = ActiveRecord::Base.connection
  @connection.exec_query(sql)
=end