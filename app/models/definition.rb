class Definition < ActiveRecord::Base
  belongs_to :word
  validates :word_definition, length: { minimum: 6 }
  has_many :lesson_words, through: :lesson_word_definitions
end
