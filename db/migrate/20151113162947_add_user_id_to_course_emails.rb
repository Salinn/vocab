class AddUserIdToCourseEmails < ActiveRecord::Migration
  def change
    add_belongs_to :course_emails, :user, index: true
  end
end
