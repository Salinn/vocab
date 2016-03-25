class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :lesson
  belongs_to :lesson_module

  def self.add_or_update(user, answer)
    #DO a find_or create by with user id, lesson_module, etc
    course = answer.question.lesson_module.lesson.course
    lesson = answer.question.lesson_module.lesson
    lesson_module = answer.question.lesson_module

    #lesson module grade
    total_answered_correct = (Answer.where(user_id: user.id, question_id: lesson_module.questions, correct: true)).length
    lesson_module_grade = Grade.find_by(user_id: user.id, lesson_module_id: lesson_module.id)
    lesson_module_total_grade = ((total_answered_correct.fdiv(lesson_module.questions.length)) * 100).to_i
    if lesson_module_grade.nil?
      Grade.create!(user_id: user.id, lesson_module_id: lesson_module.id, grade: lesson_module_total_grade)
    else
      lesson_module_grade.update_attributes(grade: (lesson_module_total_grade))
    end
    lesson_module_grades = Grade.where(user_id: user.id, lesson_module_id: lesson.lesson_modules)

    #lesson grade
    lesson_total_grade = 0
    lesson_module_grades.each do |lmg|
      lesson_total_grade += (lmg.grade * ((lmg.lesson_module.value_percentage).fdiv(100)))
    end
    lesson_grade = Grade.find_by(user_id: user.id, lesson_id: lesson.id)
    if lesson_grade.nil?
      Grade.create!(user_id: user.id, lesson_id: lesson.id, grade: lesson_total_grade)
    else
      lesson_grade.update_attributes(grade: lesson_total_grade)
    end
    lesson_grades = Grade.where(user_id: user.id, lesson_id: course.lessons)

    #course grade
    course_points = 0
    course.lessons.map { |lesson| course_points += lesson.lesson_points }
    course_total_grade = 0
    lesson_grades.each do |current_lesson_grade|
      course_total_grade += current_lesson_grade.grade
    end
    course_total_grade = (course_total_grade.fdiv(course_points) * 50).to_i

    course_grade = Grade.find_by(user_id: user.id, course_id: course.id)
    if course_grade.nil?
      Grade.create!(user_id: user.id, course_id: course.id, grade: course_total_grade)
    else
      course_grade.update_attributes(grade: course_total_grade)
    end
  end
end
