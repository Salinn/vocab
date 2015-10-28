class CreateWordForms < ActiveRecord::Migration
  def change
    create_table :word_forms do |t|
      t.string :associated_word

      t.timestamps null: false
    end
    add_reference :word_forms, :word, index: true, foreign_key: true
  end
end
