class LessonWordForm < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :word_form

  validates_uniqueness_of :lesson_word_id, :scope => :word_form_id
end
