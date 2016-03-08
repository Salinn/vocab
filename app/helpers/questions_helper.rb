module QuestionsHelper
  def what_circle_type(question, current_question_id)
    (question && current_question_id == question.id) ? 'focused_circle' : 'circle'
  end
  def get_total_correct(total_correct, questions_length)
    ((total_correct.fdiv(questions_length)) * 100)
  end
end
