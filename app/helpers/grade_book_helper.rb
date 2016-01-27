module GradeBookHelper
  def get_grades(answers, lesson, user, final_grade, final_time)
    grade, time = answers["#{user.id}.#{lesson.id}"]
    [grade, time, (final_grade+grade), (final_time+time)]
  end

  def get_final_grade(final_grade, lessons_length)
    final_grade.fdiv(lessons_length).to_i
  end
end
