class CreateLessonWordDefinitions < ActiveRecord::Migration
  def change
    create_table :lesson_word_definitions do |t|
      t.belongs_to :lesson_word, index: true, foreign_key: true
      t.belongs_to :definition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
