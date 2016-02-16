class Definition < ActiveRecord::Base
  belongs_to :word
  validates :word_definition, length: { minimum: 6 }
  has_many :lesson_words, through: :lesson_word_definitions

  UNRANSACKABLE_ATTRIBUTES = ['id', 'word_id', 'created_at', 'updated_at']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
