class DropCoursesUsers < ActiveRecord::Migration
  def change
    drop_table :courses_users
  end
end
