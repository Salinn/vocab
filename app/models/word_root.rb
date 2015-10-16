class WordRoot < ActiveRecord::Base
  has_and_belongs_to_many :words

  validates :root_name, length: { in: 1..10 }
  validates :root_definition, length: { minimum: 4 }
end
