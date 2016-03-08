#Course Info
courses_to_create = 1
course_name = 'College 101'
start_date = Date.today
end_date = Date.today + 5.months

#Users
total_teachers = 1
total_students = 30

#Lessons
lessons_to_create = 15
words = Word.where(id: [13...23])
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
    teachers = User.where(id: [2..5])
    teachers.each do |teacher|
      teacher.add_role(:teacher, course)
    end
  end

#Create Users(Students)
  (0...total_students).each do
    student = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'topsecret', password_confirmation: 'topsecret')
    student.add_role(:student, course)
  end

#Create Lessons
  (0...lessons_to_create).each do |index|
    lesson = Lesson.create!(lesson_name: "Lesson #{index + 1}", lesson_points: 50, lesson_start_time: lesson_start_time, lesson_end_date: lesson_end_date, course_id: course.id, penalty: 5)
    puts "Created Lesson ##{index+1}"

    #Sets next lesson's start and end date
    lesson_start_time = lesson_start_time + 8.days
    lesson_end_date = lesson_start_time + 7.days
    #Creates the words that are associated with this lesson
    words.each do |word|
      puts "Word: #{word.id}"
      puts "Lesson: #{lesson.id}"
      lesson_word = LessonWord.create!(lesson: lesson, word: word)
      LessonWordDefinition.create!(lesson_word: lesson_word, definition: word.definitions.first) if word.definitions.any?
      LessonWordSentence.create!(lesson_word: lesson_word, sentence: word.sentences.first) if word.sentences.any?
      LessonWordSynonym.create!(lesson_word: lesson_word, synonym: word.synonyms.first) if word.synonyms.any?
      LessonWordForm.create!(lesson_word: lesson_word, word_form: word.word_forms.first) if word.word_forms.any?
      LessonWordVideo.create!(lesson_word: lesson_word, word_video: word.word_videos.first) if word.word_videos.any?
      puts "Created Lesson Word ##{word.name}"
    end
    #Creates the Questions and AnswerOptions by setting each lesson module to true
    puts "Turing on lesson Modules"
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
            answer_options = question.answer_options.pluck(:id)
            is_true = (rand(2) == 1 ? true : false)
            time = rand(3...25)
            answer_picked = answer_options[rand(0...3)]
            Answer.create!(question_id: question.id, user_id: user.id, time_to_complete: time, correct: is_true, answer_option_id: answer_picked)
            break if is_true
          end
        end
      end
      puts "Created Answers For #{course.class_name} #{lesson.lesson_name}, module #{lesson_module.name}"
    end
    puts "Finished creating answers for #{lesson.lesson_name}"
  end
  puts "Finished creating answers for Course #{course.class_name}"
end
