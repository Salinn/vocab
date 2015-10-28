class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
