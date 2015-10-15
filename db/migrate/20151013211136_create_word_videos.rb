class CreateWordVideos < ActiveRecord::Migration
  def change
    create_table :word_videos do |t|
      t.string :video_link

      t.timestamps null: false
    end
  end
end
