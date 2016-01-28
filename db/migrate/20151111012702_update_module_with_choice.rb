class UpdateModuleWithChoice < ActiveRecord::Migration
  def change
    add_column :lesson_modules, :number_of_answers, :integer
  end
end
