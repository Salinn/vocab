class WordForm < ActiveRecord::Base
  belongs_to :word

  has_many :lesson_words, through: :lesson_word_word_forms

  validates :associated_word , length: {minimum: 1}
end
