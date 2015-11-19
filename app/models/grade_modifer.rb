class GradeModifer < ActiveRecord::Base
  belongs_to :user
  belongs_to :lessons
  belongs_to :courses
  belongs_to :lesson_module
  belongs_to :question
end
