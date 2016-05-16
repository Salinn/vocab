class Question < ActiveRecord::Base
  belongs_to :lesson_module
  belongs_to :lesson_word
  has_many :answer_options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :lesson_module_id, presence: true
  validates :lesson_word_id, presence: true

  before_save :check_for_answers

  def check_for_answers
    if question_string_changed?
      unless check_if_answer_exists
        errors.add(:question, 'This Module Cannot be changed if there are any student answers')
        return false
      end
    end
    true
  end

  def check_if_answer_exists
    answers.any? ? false : true
  end

  def check_user(user_id)
    user_answers = answers.where(user_id: user_id)
    [correct?(user_answers), wrong?(user_answers)]
  end

  def correct?(user_answers)
    return true if user_answers.any? { |answer| answer.correct? }
    false
  end

  def wrong?(user_answers)
    return true if user_answers.length >= lesson_module.attempts && !user_answers.any? { |answer| answer.correct? }
    false
  end
end
