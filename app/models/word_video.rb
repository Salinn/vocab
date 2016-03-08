class WordVideo < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words, through: :lesson_word_videos
  validates :video_link , length: {minimum: 8}
  validates :video_description , length: {minimum: 4}

  UNRANSACKABLE_ATTRIBUTES = ['id', 'word_id', 'created_at', 'updated_at']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def youtube_embed
    if video_link =~ /watch\?v=/
      puts video_link.sub("watch\?v=", "embed/")
      return video_link.sub("watch\?v=", "embed/")
    end
    video_link
  end
end

