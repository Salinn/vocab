class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :word_definition
      t.word :belongs_to

      t.timestamps null: false
    end
  end
end
