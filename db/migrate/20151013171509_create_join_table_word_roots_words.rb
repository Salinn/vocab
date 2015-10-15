class CreateJoinTableWordRootsWords < ActiveRecord::Migration
  def change
    create_join_table :words, :word_roots do |t|
      t.index [:word_id, :word_root_id]
      t.index [:word_root_id, :word_id]
    end
  end
end
