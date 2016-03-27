class GradeBookController < ApplicationController
  before_action :set_grade_book, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.find(params['course_id'])
  end

  def course
    @grade_modifiers = Hash.new(0)
    @course = Course.includes(:lessons).find(params['course_id'])
    @users = User.with_role(:student, @course)
    modifiers = GradeModifer.where("user_id IN (?) OR course_id =? OR lesson_id IN (?)", @users.pluck(:id), @course.id, @course.lessons.pluck(:id))
    modifiers.each do |modifier|
      if modifier.course_id && modifier.user_id
        @grade_modifiers["user#{modifier.user_id}"] = modifier.modified_grade_value
      elsif modifier.course_id
        @grade_modifiers["course#{modifier.course_id}"] = modifier.modified_grade_value
      elsif modifier.lesson_id && modifier.user_id
        @grade_modifiers["#{modifier.user_id}-#{modifier.lesson_id}"] = modifier.modified_grade_value
      elsif modifier.lesson_id
        @grade_modifiers["lesson#{modifier.lesson_id}"] = modifier.modified_grade_value
      else
        @grade_modifiers["#{modifier.user_id}-#{modifier.lesson_module_id}"] = modifier.modified_grade_value
      end
    end
    @grades = Gradebook.course_grades(@users, @course)
  end

  def lesson
    @course = Course.find(params['course_id'])
    @lesson = Lesson.includes(:lesson_modules).find(params['lesson_id'])
    @users = User.with_role(:student, @course)
    @grades = Gradebook.lesson_grades(@users, @lesson)
  end

  def lesson_module
    @course = Course.find(params['course_id'])
    @lesson_module = LessonModule.includes(:questions).find(params['lesson_module_id'])
    @users = User.with_role(:student, @course)
    sql = "SELECT * FROM answers
          LEFT JOIN questions ON answers.question_id=questions.id
          LEFT JOIN lesson_modules ON questions.lesson_module_id=lesson_modules.id
          WHERE lesson_modules.id = #{@lesson_module.id}"
    @answers = Gradebook.lesson_module_grades(ActiveRecord::Base.connection.select_all(sql), @users, @lesson_module)
  end

  def student_grade
    @course = Course.includes(lessons: [lesson_modules: :questions]).find(params['course_id'])
    @user = User.find(params['student_id'])
    sql = "SELECT * FROM answers
          LEFT JOIN questions ON answers.question_id=questions.id
          LEFT JOIN lesson_modules ON questions.lesson_module_id=lesson_modules.id
          LEFT JOIN lessons ON lesson_modules.lesson_id=lessons.id
          LEFT JOIN courses ON lessons.course_id=courses.id
          WHERE courses.id = #{@course.id} AND answers.user_id = #{@user.id}"
    @answers, @student_answers = Gradebook.student_grades(ActiveRecord::Base.connection.select_all(sql), @course)
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
