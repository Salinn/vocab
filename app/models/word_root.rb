class WordRoot < ActiveRecord::Base
  has_many :root_managers
  has_many :words, through: :root_managers

  validates :root_name, length: { in: 1..10 }
  validates :root_definition, length: { minimum: 4 }
end
