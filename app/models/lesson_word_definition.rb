class LessonWordDefinition < ActiveRecord::Base
  belongs_to :lesson_word
  belongs_to :definition
end
