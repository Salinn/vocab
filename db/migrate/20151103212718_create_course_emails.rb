class CreateCourseEmails < ActiveRecord::Migration
  def change
    create_table :course_emails do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
