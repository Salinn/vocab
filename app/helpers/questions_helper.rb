module QuestionsHelper
  def what_circle_type(question, current_question_id)
    (question && current_question_id == question.id) ? 'focused_circle' : 'circle'
  end

  def get_total_correct(total_correct, questions_length)
    ((total_correct.fdiv(questions_length)) * 100)
  end

  def study_the_word_sentence(answer_option, question)
    answer_option.lesson_word.sentences.first.word_sentence.gsub(/#{answer_option.lesson_word.word.name}/i, question.lesson_word.word.name)
  end

  def study_the_word_form(answer_option)
    answer_option.lesson_word.word_forms.first.associated_word
  end

  def study_the_word_synonym(answer_option)
    answer_option.lesson_word.synonyms.first.word_synonym
  end

  def study_the_word_definition(answer_option)
    answer_option.lesson_word.definitions.first.word_definition
  end
end
