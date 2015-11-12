class Synonym < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words, through: :lesson_word_synonyms
  validates :word_synonym, length: { minimum: 4 }
end
