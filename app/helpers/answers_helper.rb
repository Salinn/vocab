module AnswersHelper
  def answer_option_words(answer_id, option_id)
    classes = ''
    classes = 'green' if answer_id == option_id
    classes
  end

  def question_title(correct, wrong)
    classes = ''
    classes = 'green' if correct
    classes = 'red' if wrong
    classes
  end
end
