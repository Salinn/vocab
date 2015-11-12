class CreateRootManagers < ActiveRecord::Migration
  def change
    create_table :root_managers do |t|
      t.belongs_to :word, index: true, foreign_key: true
      t.belongs_to :word_root, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
