class AnswerOption < ActiveRecord::Base
  belongs_to :question
  belongs_to :lesson_word
end
