class WordRoot < ActiveRecord::Base
  validates :root_name, length: { in: 1..10 }
  validates :root_definition, length: { minimum: 4 }
end
