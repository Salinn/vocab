class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :lesson_module, index: true, foreign_key: true
      t.belongs_to :lesson_word, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
