module LessonsHelper
  def lesson_words_link(lesson_word)
    if lesson_word.word_id.nil?
      ''
    else
      link_to(lesson_word.word.name, lesson_word)
    end
  end
end
