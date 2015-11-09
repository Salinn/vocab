class LessonModule < ActiveRecord::Base
  belongs_to :lesson

  validates :name, length: { minimum: 4 }
  validates :attempts, numericality: { greater_than_or_equal_to: 0 }
  validates :in_use, presence: true
  validates :value_percentage, numericality: { greater_than_or_equal_to:0, less_than_or_equal_to: 100 }
end
