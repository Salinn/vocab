class GradeModifiersController < ApplicationController
  respond_to :html, :js

  def show
  end

  def index
    @grade = params[:grade]
    @course = Course.find(params[:course_id])
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @grade_modifier = GradeModifer.find_by(user_id: @user.id, lesson_id: @lesson.id)
    @grade_modifier = GradeModifer.new if @grade_modifier.nil?
  end

  def new
    GradeModifer.new
  end

  def create
    @grade_modifier = GradeModifer.new(grade_modfier_params)
    respond_to do |format|
      if @grade_modifier.save!
        format.js
      else
        format.html { render :new }
        format.json { render json: @grade_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @grade_modifier = GradeModifer.find(params[:id])
    @old_grade = @grade_modifier.modified_grade_value
    respond_to do |format|
      if @grade_modifier.update(grade_modfier_params)
        format.js
      else
        format.html { render :edit }
        format.json { render json: @grade_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def grade_modfier_params
    params.require(:grade_modifer).permit(:user_id, :lesson_id, :course_id, :lesson_module_id, :modified_grade_value)
  end

  def set_grade_modfier
    @definition = Definition.find(params[:id])
  end
end
