class WordVideo < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words, through: :lesson_word_videos
  validates :video_link , length: {minimum: 8}
  validates :video_description , length: {minimum: 4}
end

