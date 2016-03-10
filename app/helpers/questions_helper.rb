module QuestionsHelper
  def what_circle_type(question, current_question_id)
    (question && current_question_id == question.id) ? 'focused_circle' : 'circle'
  end

  def get_total_correct(total_correct, questions_length)
    ((total_correct.fdiv(questions_length)) * 100)
  end

  def study_the_word_sentance(answer_option, question)
    answer_option.lesson_word.sentences.first.word_sentence.gsub(/#{answer_option.lesson_word.word.name}/i, question.lesson_word.word.name)
  end
end
