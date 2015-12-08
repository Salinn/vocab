class LessonModule < ActiveRecord::Base

  belongs_to :lesson
  has_many :questions

  validates :name, length: { minimum: 4 }
  validates :attempts, numericality: { greater_than_or_equal_to: 0 }
  validates :in_use, inclusion: { in: [true, false] }
  validates :value_percentage, numericality: { greater_than_or_equal_to:0, less_than_or_equal_to: 100 }
  validate :check_if_answer_exists, on: :update
  validate :check_if_enough_lesson_words, on: :update

  after_update :create_questions
  before_save :update_answer_options

  def create_questions
    if in_use?
      lesson.lesson_words.each do |lesson_word|
        Question.create!(lesson_word: lesson_word, lesson_module: self) unless questions.map(&:lesson_word_id).include? lesson_word.id
      end
    end
  end

  def check_if_answer_exists
    questions.each do |question|
      return false if question.answers.any?
    end
    return true
  end

  def check_if_enough_lesson_words
    (lesson.lesson_words.length > number_of_answers) ? true : false
  end

  def update_answer_options
    if number_of_answers_changed?
      questions.each do |question|
        question.update_answer_options
      end
    end
  end
end

