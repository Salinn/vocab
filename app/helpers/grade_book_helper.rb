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

  def answer_correct?(grade)
    (grade == 1) ? true : false
  end

  def seconds_to_time(seconds)
    [seconds / 3600, seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
  end
end
