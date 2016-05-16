class LessonModule < ActiveRecord::Base

  belongs_to :lesson
  has_many :questions, dependent: :destroy

  validates :name, length: { minimum: 4 }
  validates :attempts, numericality: { greater_than_or_equal_to: 0 }
  validates :in_use, inclusion: { in: [true, false] }
  validates :value_percentage, numericality: { greater_than_or_equal_to:0, less_than_or_equal_to: 100 }
  validate :check_if_answer_exists, on: :update
  validate :check_if_enough_lesson_words, on: :update

  before_save :check_for_answers, :number_of_answers_changed

  def pretest(lesson_word)
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Pretest')
  end

  def check_if_answer_exists
    questions.each do |question|
      return false if question.answers.any?
    end
    return true
  end

  def check_if_enough_lesson_words
    unless check_if_answer_exists
      return (lesson.lesson_words.length > number_of_answers) ? true : false
    end
    return true
  end

  def check_for_answers
    if number_of_answers_changed? || attempts_changed?
      unless check_if_answer_exists
        errors.add(:lesson_module, 'This Module Cannot be changed if')
        return false
      end
    end
    return true
  end

  def number_of_answers_changed
    if number_of_answers_changed?
      update_answer_options
    end
  end

  def update_answer_options
    questions.each do |question|
      (number_of_answers > number_of_answers_was) ? question.add_options : question.remove_options
    end
  end

  def lesson_update_answer_options
    questions.each do |question|
      question.update_all_answer_options
    end
  end

  def all_questions_completed(user_id)
    total_correct = 0
    flag = true
    questions.each do |question|
      answers = question.answers.where(user_id: user_id)
      correct_question = answers.any? { |answer| answer.correct }
      total_correct += 1 if correct_question
      next if answers.length > 0 && (answers.length == attempts || correct_question )
      flag = false
    end
    [flag, total_correct]
  end
end