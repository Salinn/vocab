class Lesson < ActiveRecord::Base
  belongs_to :course

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  validates :penalty, inclusion: 0..100
  # validates :course, presence: true Causing issue with tests
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true
end
