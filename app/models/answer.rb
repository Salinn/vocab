class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :answer_option

  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :time_to_complete, numericality: { only_integer: true }
  validates :correct, inclusion: { in: [true, false] }
  #validates :answer_option_id, presence: true

  after_create :delayed_jobs_kicked_off

  # validate :not_an_answer_option
  #
  # def not_an_answer_option
  #   @wrong_answers = Answer.where(user_id: self.user_id, question_id: self.question_id).pluck(:answer_option_id)
  #   errors.add(:answer, 'Already existing answer') if @wrong_answers.include?(answer_option.id)
  # end

  def delayed_jobs_kicked_off
    Grade.add_or_update(self.user, self) if correct?
  end
end
