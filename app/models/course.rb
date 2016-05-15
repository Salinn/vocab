class Course < ActiveRecord::Base
  require 'csv'
  resourcify

  has_many :course_emails, dependent: :destroy
  has_many :course_users
  has_many :users, through: :course_users
  has_many :lessons, dependent: :destroy
  has_many :grade_modifers, dependent: :destroy
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

    user.first_name = user_hash["FIRSTNAME"]
    user.last_name = user_hash["LASTNAME"]
    user.password = Devise.friendly_token.first(8)

    raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
    user.reset_password_token = hashed_token
    user.reset_password_sent_at = Time.now.utc
    user.save

    user.add_role :student, course
    UserMailer.add_to_class_email(course, user, raw_token).deliver_later
  end

  def duplicate_course(start_date)
    course = course_duplication(start_date)
    teacher = User.with_role(:teacher, self).first
    teacher.add_role :teacher, course
    course
  end

  def share_course(teacher, start_date)
    course = course_duplication(start_date)
    teacher.add_role :teacher, course
    course
  end

  def course_duplication(start_date)
    course = self.dup
    course.start_date = start_date.to_date
    course.end_date = Date.today + (end_date - start_date.to_date)
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
        dup_lesson_word.sneaky_save
        lesson_word.definitions.each do |definition|
          LessonWordDefinition.create!(lesson_word: dup_lesson_word, definition: definition)
        end
        lesson_word.sentences.each do |sentence|
          LessonWordSentence.create!(lesson_word: dup_lesson_word, sentence: sentence)
        end
        lesson_word.synonyms.each do |synonym|
          LessonWordSynonym.create!(lesson_word: dup_lesson_word, synonym: synonym)
        end
        lesson_word.word_forms.each do |word_form|
          LessonWordForm.create!(lesson_word: dup_lesson_word, word_form: word_form)
        end
        lesson_word.word_videos.each do |word_video|
          LessonWordVideo.create!(lesson_word: dup_lesson_word, word_video: word_video)
        end
      end
      #TODO figure out callback issue
      # dup_lesson.lesson_modules.each do |lesson_module|
      #   dup_lesson_module = lesson_module.dup
      #   dup_lesson_module.lesson = dup_lesson
      #   dup_lesson_module.save
      #   lesson_module.questions.each do |question|
      #     dup_question = question.dup
      #     dup_question.lesson_module = dup_lesson_module
      #     dup_question.save
      #     question.answer_options.each do |answer_option|
      #       dup_answer_option = answer_option.dup
      #       dup_answer_option.question = dup_question
      #       dup_answer_option.save
      #     end
      #   end
      # end
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
