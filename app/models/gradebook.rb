class Gradebook
  def self.course_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end
  def self.lesson_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end
  def self.lesson_model_grades(user, question)
    Answer.where(user_id: user.id, question_id: question.id)
  end
=begin
  "select * from info WHERE `question_id` IN ('1,2,3,4,5')"
  sql = "SELECT * FROM answers WHERE `id` IN (#{questions.map{|x| x.id}.join(', ')})"
  @connection = ActiveRecord::Base.connection
  @connection.exec_query(sql)
=end
end