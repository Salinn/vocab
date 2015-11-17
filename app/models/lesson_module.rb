class LessonModule < ActiveRecord::Base
  belongs_to :lesson
  has_many :questions

  validates :name, length: { minimum: 4 }
  validates :attempts, numericality: { greater_than_or_equal_to: 0 }
  validates :in_use, presence: true
  validates :value_percentage, numericality: { greater_than_or_equal_to:0, less_than_or_equal_to: 100 }

  after_update :create_questions

  def create_questions
    if in_use?
      lesson.lesson_words.each do |lesson_word|
        Question.create!(lesson_word: lesson_word, lesson_module: self) unless questions.map(&:lesson_word_id).include? lesson_word.id
      end
    end
  end
end

