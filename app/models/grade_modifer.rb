class GradeModifer < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :course
  belongs_to :lesson_module
  #belongs_to :question
end
