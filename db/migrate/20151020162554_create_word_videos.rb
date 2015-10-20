class CreateWordVideos < ActiveRecord::Migration
  def change
    create_table :word_videos do |t|
      t.string :video_link
      t.string :video_description
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
