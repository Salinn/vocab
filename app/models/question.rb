class Question < ActiveRecord::Base
  belongs_to :lesson_module
  belongs_to :lesson_word
end
