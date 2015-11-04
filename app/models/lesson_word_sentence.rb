class LessonWordSentence < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :sentence

  validates_uniqueness_of :lesson_word_id, :scope => :sentence_id
end
