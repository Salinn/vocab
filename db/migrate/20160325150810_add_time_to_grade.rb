class AddTimeToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :time, :integer
  end
end
