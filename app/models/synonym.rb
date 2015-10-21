class Synonym < ActiveRecord::Base
  belongs_to :word
  validates :word_synonym, length: { minimum: 4 }
end
