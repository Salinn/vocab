class LessonWordVideo < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :word_video

  validates_uniqueness_of :lesson_word_id, :scope => :word_video_id
end
