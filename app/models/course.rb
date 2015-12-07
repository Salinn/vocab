class Course < ActiveRecord::Base
  require 'csv'
  resourcify

  has_many :course_emails
  has_many :course_users
  has_many :users, through: :course_users
  has_many :lessons
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :course_users

  validates :class_name, length: { in: 3..100  }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.import(file, course_id)
    #http://richonrails.com/articles/importing-csv-files
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash # exclude the price field
      email = user_hash["EMAIL"]
      user = User.find_or_create_by(email: email)
      set_user_attributes(user, user_hash, course_id)
    end # end CSV.foreach
  end # end self.impo

  def self.set_user_attributes(user, user_hash, course_id)
    course = Course.find(course_id)
    generated_password = Devise.friendly_token.first(8)
    user.first_name = user_hash["FIRSTNAME"]
    user.last_name = user_hash["LASTNAME"]
    user.password = generated_password
    user.save
    CourseUser.create!(user_id: user.id, course_id: course.id)
    UserMailer.add_to_class_email(user).deliver_later
    user.add_role :student, course
  end

  def duplicate_course
    course = course_duplication
    teacher = User.with_role(:teacher, self).first
    teacher.add_role :teacher, course
    course
  end

  def share_course(teacher)
    course = course_duplication
    teacher.add_role :teacher, course
    course
  end

  def course_duplication
    course = self.dup
    course.start_date = Date.today
    course.end_date = Date.today + (end_date - start_date)
    course.save
    lessons.each do |lesson|
      dup_lesson = lesson.dup
      dup_lesson.course = course
      dup_lesson.lesson_start_time = dup_lesson_start_time(course, lesson)
      dup_lesson.lesson_end_date = dup_lesson_end_time(course, lesson)
      dup_lesson.save
      lesson.lesson_words.each do |lesson_word|
        dup_lesson_word = lesson_word.dup
        dup_lesson_word.lesson = dup_lesson
        dup_lesson_word.save
      end
      lesson.lesson_modules.each do |lesson_module|
        dup_lesson_module = lesson_module
        dup_lesson_module.lesson = dup_lesson
        dup_lesson_module.save
        lesson_module.questions.each do |question|
          dup_question = question
          #TODO need to look into lesson_words if that needs to be duplicated or found here
          dup_question.lesson_module = dup_lesson_module
          dup_question.save
          question.answer_options.each do |answer_option|
            dup_answer_option = answer_option
            dup_answer_option.question = dup_question
            #TODO need to figure out lesson words
            #dup_answer_option.lesson_word = dup_lesson
          end
        end
      end
    end
    course
  end

  def dup_lesson_start_time(course, lesson)
    date = course.start_date + (lesson.lesson_start_time.to_date - self.start_date).to_i.days
    time = lesson.lesson_start_time
    DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
  end

  def dup_lesson_end_time(course, lesson)
    date = course.start_date + (lesson.lesson_end_date.to_date - self.start_date).to_i.days
    time = lesson.lesson_end_date
    DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
  end
end
