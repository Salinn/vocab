class CreateLessonExtensions < ActiveRecord::Migration
  def change
    create_table :lesson_extensions do |t|
      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :extension_date

      t.timestamps null: false
    end
  end
end
