module AnswersHelper
  def answer_option_words(correct, wrong)
    classes = ''
    classes = 'green' if correct
    classes = 'green' if wrong
    classes
  end

  def question_title(correct, wrong)
    classes = ''
    classes = 'red' if correct
    classes = 'green' if wrong
    classes
  end
end
