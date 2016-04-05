class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :grade
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :lesson_module, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
