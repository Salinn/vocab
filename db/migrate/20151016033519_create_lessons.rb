class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.integer :lesson_points
      t.datetime :lesson_start_time
      t.datetime :lesson_end_date
      t.belongs_to :course, index: true, foreign_key: true
      t.has_many :lesson_module, index: true, foreign_key: true
      t.integer :penalty

      t.timestamps null: false
    end
  end
end
