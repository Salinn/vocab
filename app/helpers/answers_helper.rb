module AnswersHelper
  def answer_option_words(question, option)
    classes = ''
    classes = 'green' if question.wrong?(current_user.id) && question.lesson_word_id == option.lesson_word_id
    classes = 'green' if question.correct?(current_user.id) && question.lesson_word_id == option.lesson_word_id
    classes
  end

  def question_title(question)
    classes = ''
    classes = 'red' if question.wrong?(current_user.id)
    classes = 'green' if question.correct?(current_user.id)
    classes
  end
end
