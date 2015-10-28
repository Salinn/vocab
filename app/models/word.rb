class Word < ActiveRecord::Base
  has_and_belongs_to_many :word_roots
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
end
