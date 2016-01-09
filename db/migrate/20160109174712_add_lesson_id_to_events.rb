class AddLessonIdToEvents < ActiveRecord::Migration
  def change
    add_belongs_to :events, :lesson, index: true
  end
end
