class GradeModifiersController < ApplicationController
  respond_to :html, :js

  def show
  end

  def index
    @grade = params[:grade]
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    if params[:user_id]
      @user = User.find(params[:user_id])
      @grade_modifier = GradeModifer.find_by(user_id: @user.id, lesson_id: @lesson.id)
    else
      @grade_modifier = GradeModifer.find_by(user_id: nil, lesson_id: @lesson.id)
    end
    @grade_modifier = GradeModifer.new if @grade_modifier.nil?
  end

  def new
    GradeModifer.new
  end

  def create
    if params[:grade_modifer][:user_id]
      @grade_modifier = GradeModifer.new(grade_modfier_params)
      respond_to do |format|
        if @grade_modifier.save!
          format.js
        else
          format.html { render :new }
          format.json { render json: @grade_modifier.errors, status: :unprocessable_entity }
        end
      end
    else
      @course = Course.find(params[:grade_modifer][:course_id])
      params[:grade_modifer][:course_id] = nil
      @grade_modifier = GradeModifer.create!(grade_modfier_params)
      grade_modified = Hash.new(0)
      @users = User.with_role(:student, @course)
      @modified_grade = params[:grade_modifer][:modified_grade_value]
      modifiers = GradeModifer.where("user_id IN (?) AND lesson_id = (?)", @users.pluck(:id), params[:grade_modifer][:lesson_id])
      modifiers.each { |modifier| grade_modified[modifier.user_id] = modifier.modified_grade_value }
      @users.each do |user|
        params[:grade_modifer][:user_id] = user.id
        params[:grade_modifer][:modified_grade_value] = @modified_grade.to_i + grade_modified[user.id]
        GradeModifer.create!(grade_modfier_params)
      end
    end
  end

  def edit
  end

  def update
    if params[:grade_modifer][:user_id]
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
    else
      @course = Course.find(params[:grade_modifer][:course_id])
      params[:grade_modifer][:course_id] = nil
      @grade_modifier = GradeModifer.find(params[:id])
      @old_grade = @grade_modifier.modified_grade_value
      @grade_modifier.update(grade_modfier_params)
      @users = User.with_role(:student, @course)
      @modified_grade = params[:grade_modifer][:modified_grade_value]
      modifiers = GradeModifer.where("user_id IN (?) AND lesson_id = (?)", @users.pluck(:id), params[:grade_modifer][:lesson_id])
      modifiers.each do |modifier|
        modifier.update(grade_modfier_params)
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
