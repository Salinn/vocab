class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @course = Course.find(params[:course_id])
    @lesson_module = LessonModule.find(params[:lesson_module_id])
    @questions = Question.includes(:lesson_module).where(lesson_module_id: @lesson_module.id)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to course_lesson_lesson_module_question_path(@question, lesson_module_id: @question.lesson_module, lesson_id: @question.lesson_module.lesson.id, course_id: @question.lesson_module.lesson.course.id), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  #TODO update error on views when failed updating
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to course_lesson_lesson_module_question_path(@question, lesson_module_id: @question.lesson_module, lesson_id: @question.lesson_module.lesson.id, course_id: @question.lesson_module.lesson.course.id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to course_lesson_lesson_module_questions_path(lesson_module_id: @question.lesson_module, lesson_id: @question.lesson_module.lesson.id, course_id: @question.lesson_module.lesson.course.id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.includes(answer_options: [lesson_word: :word]).find(params[:id])
      @course = Course.find(params[:course_id])
      @lesson_module = LessonModule.find(params[:lesson_module_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question_string, :lesson_module_id, :lesson_word_id)
    end
end
