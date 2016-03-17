class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_course_id, only: [:add_to_course ,:mass_add_to_course,:remove_user_from_course,
                                       :remove_lesson_from_course, :email_class, :manage_students, :manage_lessons]
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        create_relations
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
        format.js
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Course.import(params[:file], params[:course_id])
    redirect_to :back, notice: "Users imported."
  end

  def add_to_course
    user = User.find(params[:user][:user_id])
    user.new_user_added_to_course(@course)
    redirect_to :back, notice: 'The student was successfully added to the class.'
  end

  def mass_add_to_course
    params[:user][:user_emails].split(',').each do |user_email|
      user = User.find_or_create_by(email: user_email)
      user.new_user_added_to_course(@course)
    end
    redirect_to :back, notice: 'The student(s) were successfully add to the class.'
  end

  def remove_user_from_course()
    user = User.find(params[:user_id])
    user.remove_role(:student, @course)
    redirect_to course_manage_students_path(@course), notice: 'The student was successfully removed from the class.'
  end

  def remove_lesson_from_course()
    lesson = Lesson.find(params[:lesson_id])
    @course.lessons.destroy lesson
    redirect_to @course , notice: 'The lesson was successfully removed from the class.'
  end

  def duplicate_course
    course = Course.find(params[:course_id])
    new_course = course.duplicate_course
    redirect_to new_course, notice: 'Course was successfully Copied, welcome to your new course.'
  end

  def share_course
    course = Course.find(params[:course_id])
    teacher = User.find(params[:user][:teacher_id])
    course.share_course(teacher)
    redirect_to course, notice: 'Course was successfully Shared.'
  end

  def email_class
  end

  def manage_students
  end

  def manage_lessons
  end

  def syllabus
    @course = Course.find(params[:course_id])
  end

  def description
    @course = Course.find(params[:course_id])
  end

  private
    #creates relations for the teacher
    def create_relations
      current_user.add_role :teacher, @course
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_course_id
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:class_name, :start_date, :end_date, :user_id, :syllabus, :description)
    end
end
