class LessonWordSynonym < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :synonym

  validates_uniqueness_of :lesson_word_id, :scope => :synonym_id
end
