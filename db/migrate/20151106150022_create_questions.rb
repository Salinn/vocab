class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :correct_choice
      t.references :lesson_module, index: true, foreign_key: true
      t.references :lesson_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
