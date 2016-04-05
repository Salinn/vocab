class StringToTextForCourses < ActiveRecord::Migration
  def change
    change_column :courses, :description, :text
    change_column :courses, :syllabus, :text
  end
end
