class CreateLessonModules < ActiveRecord::Migration
  def change
    create_table :lesson_modules do |t|
      t.string :name
      t.integer :attempts
      t.references :lesson, index: true, foreign_key: true
      t.boolean :in_use
      t.integer :value_percentage

      t.timestamps null: false
    end
  end
end
