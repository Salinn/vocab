class WordForm < ActiveRecord::Base
  belongs_to :word
  validates :associated_word , length: {minimum: 1}
end
