class LessonExtension < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  validates :lesson_id, presence: true
end
