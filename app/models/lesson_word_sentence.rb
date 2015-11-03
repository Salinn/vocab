class LessonWordSentence < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :sentence
end
