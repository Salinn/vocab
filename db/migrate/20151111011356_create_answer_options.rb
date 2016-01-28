class CreateAnswerOptions < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :lesson_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
