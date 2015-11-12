class CreateLessonWordSynonyms < ActiveRecord::Migration
  def change
    create_table :lesson_word_synonyms do |t|
      t.belongs_to :lesson_word, index: true, foreign_key: true
      t.belongs_to :synonym, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
