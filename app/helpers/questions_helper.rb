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

  def answered_question_text(answer_option)
    if answer_option.question.question_string =~ /definition/
      study_the_word_definition(answer_option)
    elsif answer_option.question.question_string =~ /word form/
      study_the_word_form(answer_option)
    elsif answer_option.question.question_string =~ /synonym/
      study_the_word_synonym(answer_option)
    elsif answer_option.question.question_string =~ /sentence/
      study_the_word_sentence(answer_option, answer_option.question)
    else
      option.lesson_word.word.name
    end
  end
end
