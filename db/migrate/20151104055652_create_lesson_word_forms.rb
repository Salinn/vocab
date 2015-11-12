class CreateLessonWordForms < ActiveRecord::Migration
  def change
    create_table :lesson_word_forms do |t|
      t.belongs_to :lesson_word, index: true, foreign_key: true
      t.belongs_to :word_form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
