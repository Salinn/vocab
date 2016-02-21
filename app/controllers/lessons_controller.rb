class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
    @lesson_module = LessonModule.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @words = Word.all
    @lesson.lesson_words.build
    @lesson_module = LessonModule.all
  end

  # GET /lessons/new
  def new
    course = Course.find(params[:course_id])
    @lesson = course.lessons.build
  end

  # GET /lessons/1/edit
  def edit
    @lesson.lesson_words.build
    @lesson_module = LessonModule
  end

  # POST /lessons
  # POST /lessons.json
  def create
    course = Course.find(params[:course_id])
    @lesson = course.lessons.create(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_lesson_path(@lesson,  course_id: @lesson.course.id), notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @lesson_module = LessonModule.all
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_lesson_path(@lesson,  course_id: @lesson.course.id), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson_module = LessonModule.all
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_lessons_path(course_id: @lesson.course.id), notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:lesson_name, :lesson_points, :lesson_start_time, :lesson_end_date, :course_id, :penalty,
                                     lesson_words_attributes: [:word_id, :lesson_id])
    end
end
