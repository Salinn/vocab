class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :class_name
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
