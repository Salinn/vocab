class GradeBookController < ApplicationController
  before_action :set_grade_book, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.find(params['course_id'])
  end

  def course
    @course = Course.includes(lessons: [lesson_modules: :questions]).find(params['course_id'])
    @users = User.with_role(:student, @course)
    sql = "SELECT * FROM answers
          LEFT JOIN questions ON answers.question_id=questions.id
          LEFT JOIN lesson_modules ON questions.lesson_module_id=lesson_modules.id
          LEFT JOIN lessons ON lesson_modules.lesson_id=lessons.id
          LEFT JOIN courses ON lessons.course_id=courses.id
          WHERE courses.id = #{@course.id}"
    @answers = Gradebook.course_grades(ActiveRecord::Base.connection.select_all(sql), @users, @course)
  end

  def lesson
    @course = Course.find(params['course_id'])
    @lesson = Lesson.find(params['lesson_id'])
  end

  def lesson_module
    @course = Course.find(params['course_id'])
    @lesson_module = LessonModule.find(params['lesson_module_id'])
  end

  # GET Course/gradebook/
  # GET Course/gradebook/
  def show
    #@grade_book = Gradebook.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_grade_book
    #@grade_book = LessonModule.find(params[:id])
    #@course = Course.find(params[:course_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def grade_book_params
    params.require(:grade_book).permit(:modified_grade_value)
  end
end
