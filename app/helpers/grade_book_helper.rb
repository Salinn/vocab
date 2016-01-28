module GradeBookHelper
  def get_grades(answers, lesson, user)
    answers["#{user.id}.#{lesson.id}"]
  end

  def get_grades_lesson(answers, lesson_module, user)
    grade, time = answers["#{user.id}.#{lesson_module.id}"]
  end

  def get_final_grade(final_grade, lessons_length)
    final_grade.fdiv(lessons_length).to_i
  end

  def answer_correct?(current_index, stdudent_attempts, grade)
    (((stdudent_attempts-1) == current_index) && grade == 100) ? true : false
  end
end
