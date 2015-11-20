class CreateGradeModifers < ActiveRecord::Migration
  def change
    create_table :grade_modifers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :lesson_module, index: true, foreign_key: true
      t.float :modified_grade_value

      t.timestamps null: false
    end
  end
end
