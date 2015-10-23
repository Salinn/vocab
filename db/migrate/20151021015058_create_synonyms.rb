class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.string :word_synonym
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
