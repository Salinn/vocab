class Lesson < ActiveRecord::Base
  belongs_to :course
  has_one :event, dependent: :destroy
  has_many :words, through: :lesson_words, dependent: :destroy#, after_add: :update_answers, after_remove: :update_answers
  has_many :lesson_words, dependent: :destroy
  has_many :lesson_modules, dependent: :destroy
  accepts_nested_attributes_for :lesson_words

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  #validates :penalty, inclusion: 0..100 #should be added back when penalties are used
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true

  before_create :validate_dates
  before_update :validate_dates

  after_update :update_lesson_event

  def validate_dates
    unless lesson_start_time < lesson_end_date
      errors.add(:lesson, 'The start date must come before the end date')
      return false
    end
    true
  end

  def update_lesson_event
    if event
      event.update_attributes(title: lesson_name, description: "Due date for lesson", start_time: lesson_start_time , end_time: lesson_end_date)
    else
      Event.create!(lesson_id: id, title: lesson_name, description: "Due date for lesson", start_time: lesson_start_time, end_time: lesson_end_date)
    end
  end

  def can_add_lesson_word
    lesson_modules.each do |lesson_module|
      unless lesson_module.check_if_answer_exists
        self.errors.add(:base, 'You cannot add a word to this lesson once e a student has began taking a quiz')
        return false
      end
    end
    return true
  end
end
