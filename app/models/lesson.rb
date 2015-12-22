class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :words, through: :lesson_words
  has_many :lesson_words, dependent: :destroy
  has_many :lesson_modules, dependent: :destroy
  accepts_nested_attributes_for :lesson_words, after_add: :my_method_or_proc1, after_remove: :my_method_or_proc2

  validates :lesson_name, length: { in: 3..100 }
  validates :lesson_points, inclusion: 0..100
  validates :penalty, inclusion: 0..100
  validates :lesson_start_time, presence: true
  validates :lesson_end_date, presence: true
  validate :check_if_answer_exists, on: :update

  after_create :create_modules

  def create_modules
    modules = ['Word Form', 'Definition']
    modules.each do |name|
      LessonModule.create!(name: name, attempts: 3, in_use: false, number_of_answers: 4, value_percentage: (100/modules.length).round, lesson_id: id)
    end
  end

  def check_if_answer_exists
    lesson_modules.each do |lesson_module|
      unless lesson_module.check_if_answer_exists && lesson_end_date > Date.today
        self.errors.add(:base, 'You cannot add a word to this lesson once e a student has began taking a quiz')
        return false
      end
    end
    return true
  end
end
