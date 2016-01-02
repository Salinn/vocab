class Word < ActiveRecord::Base
  has_many :word_forms
  has_many :lessons, through: :lesson_words
  has_many :sentences
  has_many :word_videos
  has_many :definitions
  has_many :synonyms

  has_many :root_managers
  has_many :word_roots, through: :root_managers

  accepts_nested_attributes_for :sentences
  accepts_nested_attributes_for :word_videos
  accepts_nested_attributes_for :definitions
  accepts_nested_attributes_for :synonyms
  accepts_nested_attributes_for :word_forms

  UNRANSACKABLE_ATTRIBUTES = ['id', 'created_at', 'updated_at']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
