class Sentence < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words, through: :lesson_word_sentences
  validates :word_sentence, length: { minimum: 4 }
end
