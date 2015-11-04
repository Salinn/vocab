class CourseEmail < ActiveRecord::Base
  belongs_to :course

  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }
end
