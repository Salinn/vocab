class TextSavedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_string, :text
  end
end
