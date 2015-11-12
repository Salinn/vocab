class LessonWordDefinition < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :definition

  validates_uniqueness_of :lesson_word_id, :scope => :definition_id
end
