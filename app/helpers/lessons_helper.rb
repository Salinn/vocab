module LessonsHelper
  def display_completed(completed)
    completed ? 'glyphicon glyphicon-check' : 'glyphicon glyphicon-unchecked'
  end

  def total_percentage_correct(total_correct, total_questions)
    sprintf('%.0f',((total_correct.fdiv(total_questions)) * 100))
  end
end
