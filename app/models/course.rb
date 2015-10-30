class Course < ActiveRecord::Base
  resourcify

  has_and_belongs_to_many :users

  validates :class_name, length: { in: 3..100  }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
