class LessonModule < ActiveRecord::Base
  belongs_to :lesson
  has_many :questions

  after_update :create_questions

  def create_questions
    if in_use?
      lesson.lesson_words.each do |lesson_word|
        Question.create!(lesson_word: lesson_word, lesson_module: self) unless questions.map(&:lesson_word_id).include? lesson_word.id
      end
    end
  end
end

