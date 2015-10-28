class Sentence < ActiveRecord::Base
  belongs_to :word
  validates :word_sentence, length: { minimum: 4 }
end
