class Course < ActiveRecord::Base
  resourcify

  has_many :course_users
  has_many :users, through: :course_users
  has_many :lessons
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :course_users

  validates :class_name, length: { in: 3..100  }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
