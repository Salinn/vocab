class LessonWordVideo < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :word_video
end
