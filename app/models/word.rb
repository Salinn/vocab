class Word < ActiveRecord::Base
  has_and_belongs_to_many :word_roots
  has_many :lessons, through: :lesson_words
  has_many :sentences
  has_many :word_videos
  has_many :definitions
  has_many :synonyms
end
