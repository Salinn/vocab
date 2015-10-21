class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :word_sentence
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
