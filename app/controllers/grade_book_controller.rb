class GradeBookController < ApplicationController
  before_action :set_grade_book, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.find(params['course_id'])
  end

  def course
    @course = Course.find(params['course_id'])
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