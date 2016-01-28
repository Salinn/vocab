#Course Info
courses_to_create = 100
course_name = 'College 101'
start_date = Date.today
end_date = Date.today + 5.months

#Users
total_teachers = 1
total_students = 30

#Lessons
lessons_to_create = 15
words_in_lesson = 7
lesson_start_time = start_date
lesson_end_date = start_date + 7.days

#LessonModules, Questions, and AnswerOptions are auto generated

#---------------------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------#
(0...courses_to_create).each do |course_index|
#Create Course
  course = Course.create!(class_name: "#{course_name} - #{course_index}", start_date: start_date, end_date: end_date)

#Create Users(Teachers)
  (0...total_teachers).each do
    teacher = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'topsecret', password_confirmation: 'topsecret')
    teacher.add_role(:teacher, course)
  end

#Create Users(Students)
  (0...total_students).each do
    student = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'topsecret', password_confirmation: 'topsecret')
    student.add_role(:student, course)
  end

#Create Lessons
  (0...lessons_to_create).each do |index|
    lesson = Lesson.create!(lesson_name: "Lesson #{index + 1}", lesson_points: 50, lesson_start_time: lesson_start_time, lesson_end_date: lesson_end_date, course_id: course.id, penalty: 5)
    #Sets next lesson's start and end date
    lesson_start_time = lesson_start_time + 8.days
    lesson_end_date = lesson_start_time + 7.days
    #Creates the words that are associated with this lesson
    (0...words_in_lesson).each do |word_index|
      LessonWord.create!(lesson_id: lesson.id, word_id: (word_index + 1))
    end
    #Creates the Questions and AnswerOptions by setting each lesson module to true
    lesson.lesson_modules.each do |lesson_module|
      lesson_module.update_attributes(in_use: true)
    end
  end

#Create Answers
  course.lessons.each do |lesson|
    lesson.lesson_modules.each do |lesson_module|
      lesson_module.questions.each do |question|
        User.with_role(:student, course).each do |user|
          (0...lesson_module.attempts).each do
            is_true = (rand(2) == 1 ? true : false)
            time = rand(3...25)
            Answer.create!(question_id: question.id, user_id: user.id, time_to_complete: time, correct: is_true)
            break if is_true
          end
        end
      end
    end
  end
end
