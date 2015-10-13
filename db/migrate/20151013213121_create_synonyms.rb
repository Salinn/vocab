class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.string :word_synonym

      t.timestamps null: false
    end
  end
end
