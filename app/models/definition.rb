class Definition < ActiveRecord::Base
  belongs_to :word

  validates :word_definition, length: { minimum: 4 }
end
