class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :time_to_complete
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
