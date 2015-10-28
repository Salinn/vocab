class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  has_many :lesson_word_definitions
  has_many :definitions, through: :lesson_word_definitions
  accepts_nested_attributes_for :lesson_word_definitions
end
