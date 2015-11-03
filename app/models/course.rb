class Course < ActiveRecord::Base
  require 'csv'
  resourcify

  has_many :course_users
  has_many :users, through: :course_users
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :course_users

  validates :class_name, length: { in: 3..100  }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.import(file, course_id)
    #http://richonrails.com/articles/importing-csv-files
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash # exclude the price field
      email = user_hash["EMAIL"]
      user = User.find_or_create_by(email: email)
      set_user_attributes(user, user_hash, course_id)
    end # end CSV.foreach
  end # end self.impo

  def self.set_user_attributes(user, user_hash, course_id)
    course = Course.find(course_id)
    generated_password = Devise.friendly_token.first(8)
    user.first_name = user_hash["FIRSTNAME"]
    user.last_name = user_hash["LASTNAME"]
    user.password = generated_password
    user.save
    CourseUser.create!(user_id: user.id, course_id: course.id)
    user.add_role :student, course
  end
end
