class Lesson < ActiveRecord::Base
  belongs_to :course
  has_one :event, dependent: :destroy
  has_many :words, through: :lesson_words, after_add: :update_answers, after_remove: :update_answers
  has_many :lesson_words, dependent: :destroy
  has_many :lesson_modules, dependent: :destroy
  accepts_nested_attributes_for :lesson_words

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  validates :penalty, inclusion: 0..100
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true

  after_create :create_modules, :create_lesson_event
  after_update :update_lesson_event

  def create_modules
    modules = ['Definition', 'Sentence', 'Synonym', 'Word Form']
    modules.each do |name|
      LessonModule.create!(name: name, attempts: 3, in_use: false, number_of_answers: 4, value_percentage: (100/modules.length).round, lesson_id: id)
    end
  end

  def create_lesson_event
    Event.create!(lesson_id: id, title: lesson_name, description: "Due date for lesson", start_time: lesson_start_time, end_time: lesson_end_date)
  end

  def update_lesson_event
    if event
      event.update_attributes(title: lesson_name, description: "Due date for lesson", start_time: lesson_start_time , end_time: lesson_end_date)
    else
      create_lesson_event
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
