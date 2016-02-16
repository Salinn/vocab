class WordRoot < ActiveRecord::Base
  has_many :root_managers
  has_many :words, through: :root_managers

  validates :root_name, length: { in: 1..10 }
  validates :root_definition, length: { minimum: 4 }

  UNRANSACKABLE_ATTRIBUTES = ['id', 'word_id', 'created_at', 'updated_at']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
