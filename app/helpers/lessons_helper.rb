module LessonsHelper
  def lesson_words_link(lesson_word)
    if lesson_word.word_id.nil?
      ''
    else
      link_to(lesson_word.word.name, course_lesson_lesson_word_path(lesson_word, lesson_id: lesson_word.lesson.id, course_id: lesson_word.lesson.course.id))
    end
  end
end
