class ChangeSentanceFromStringToText < ActiveRecord::Migration
  def change
    change_column :sentences, :word_sentence, :text
  end
end
