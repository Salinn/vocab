class WordVideo < ActiveRecord::Base
  belongs_to :word
  validates :video_link , length: {minimum: 8}
  validates :video_description , length: {minimum: 4}
end

