module AnswersHelper
  def answer_option_words(answer_id, option_id, wrong_answers)
    classes = ''
    classes = 'correct-bullet' if answer_id == option_id
    classes = 'wrong-bullet' if wrong_answers.include?(option_id) && answer_id != option_id
    classes = 'bullet' if classes == ''
    classes
  end

  def question_title(correct, wrong)
    classes = ''
    classes = 'correct-bullet-big' if correct
    classes = 'wrong-bullet-big' if wrong
    classes
  end
end
