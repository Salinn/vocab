class AddWordReferenceToDefinitions < ActiveRecord::Migration
  def change
    add_reference :definitions, :word, index: true, foreign_key: true
  end
end
