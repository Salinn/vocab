class Synonym < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words, through: :lesson_word_synonyms
  validates :word_synonym, length: { minimum: 4 }

  UNRANSACKABLE_ATTRIBUTES = ['id', 'word_id', 'created_at', 'updated_at']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
