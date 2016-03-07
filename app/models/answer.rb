class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :time_to_complete, numericality: { only_integer: true }
  validates :correct, inclusion: { in: [true, false] }
  #validates :answer_option_id, presence: true
end
