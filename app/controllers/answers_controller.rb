class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
    @question = Question.find(params[:question_id])
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    end_time = Time.now
    @answer = Answer.new(answer_params)
    @answer.time_to_complete = (end_time - (params[:answer][:start_time]).to_time).to_i
    @answer.correct = (@answer.answer_option_id == @answer.question.answer_options_id ? true : false)
    @course = Course.find(params[:course_id])
    @lesson_module = LessonModule.find(params[:lesson_module_id])

    respond_to do |format|
      if @answer.save
        @wrong_answers = Answer.where(user_id: current_user.id, question_id: @answer.question_id).pluck(:answer_option_id)
        format.js
        format.html { redirect_to course_lesson_lesson_module_question_answer_path(@answer, question_id: @answer.question.id, lesson_module_id: @answer.question.lesson_module.id, lesson_id: @answer.question.lesson_module.lesson.id, course_id: @answer.question.lesson_module.lesson.course.id), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to course_lesson_lesson_module_question_answer_path(@answer, question_id: @answer.question.id, lesson_module_id: @answer.question.lesson_module.id, lesson_id: @answer.question.lesson_module.lesson.id, course_id: @answer.question.lesson_module.lesson.course.id), notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to course_lesson_lesson_module_question_answers_path(question: @answer.question, lesson_module_id: @answer.question.lesson_module, lesson_id: @answer.question.lesson_module.lesson.id, course_id: @answer.question.lesson_module.lesson.course.id), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :answer_option_id)
    end
end
