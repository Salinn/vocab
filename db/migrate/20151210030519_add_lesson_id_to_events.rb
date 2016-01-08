class AddLessonIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lesson_id, :integer
  end
end
