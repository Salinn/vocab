class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :words, through: :lesson_words
  has_many :lesson_words
  has_many :lesson_modules
  accepts_nested_attributes_for :lesson_words

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  validates :penalty, inclusion: 0..100
  # validates :course, presence: true Causing issue with tests
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true
end
