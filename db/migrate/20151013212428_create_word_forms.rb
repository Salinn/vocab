class CreateWordForms < ActiveRecord::Migration
  def change
    create_table :word_forms do |t|
      t.string :associated_word

      t.timestamps null: false
    end
  end
end
