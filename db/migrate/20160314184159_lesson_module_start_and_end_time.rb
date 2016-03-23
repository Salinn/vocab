class LessonModuleStartAndEndTime < ActiveRecord::Migration
  def change
    add_column :lesson_modules, :start_time, :datetime
    add_column :lesson_modules, :end_time, :datetime
  end
end
