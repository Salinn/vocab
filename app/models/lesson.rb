class Lesson < ActiveRecord::Base
  belongs_to :course
  has_one :event
  has_many :words, through: :lesson_words
  has_many :lesson_words, dependent: :destroy
  has_many :lesson_modules, dependent: :destroy
  accepts_nested_attributes_for :lesson_words

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  validates :penalty, inclusion: 0..100
  # validates :course, presence: true Causing issue with tests
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true

  after_create :create_modules, :create_event

  def create_modules
    modules = ['Word Form', 'Definition']
    modules.each do |name|
      LessonModule.create!(name: name, attempts: 3, in_use: true, value_percentage: (100/modules.length).round, lesson_id: id)
    end
  end

  def create_event
    Event.create!(title: lesson_name, description: "Due date for lesson", start_time: lesson_start_time , end_time: lesson_end_date)
  end
end
