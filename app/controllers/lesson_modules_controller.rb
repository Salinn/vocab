class LessonModulesController < ApplicationController
  before_action :set_lesson_module, only: [:show, :edit, :update, :destroy]

  # GET /lesson_modules
  # GET /lesson_modules.json
  def index
    @lesson_module = LessonModule.all
  end

  # GET /lesson_modules/1
  # GET /lesson_modules/1.json
  def show
  end

  # GET /lesson_modules/new
  def new
    @lesson_module = LessonModule.new
  end

  # GET /lesson_modules/1/edit
  def edit
  end

  # POST /lesson_modules
  # POST /lesson_modules.json
  def create
    @lesson_module = LessonModule.new(lesson_module_params)

    respond_to do |format|
      if @lesson_module.save
        format.html { redirect_to @lesson_module, notice: 'Lesson module was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_module }
      else
        format.html { render :new }
        format.json { render json: @lesson_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_modules/1
  # PATCH/PUT /lesson_modules/1.json
  def update
    respond_to do |format|
      if @lesson_module.update(lesson_module_params)
        format.html { redirect_to @lesson_module.lesson, notice: 'Lesson module was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_module }
      else
        format.html { render :edit }
        format.json { render json: @lesson_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_modules/1
  # DELETE /lesson_modules/1.json
  def destroy
    @lesson_module.destroy
    respond_to do |format|
      format.html { redirect_to lesson_modules_url, notice: 'Lesson module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_module
      @lesson_module = LessonModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_module_params
      params.require(:lesson_module).permit(:name, :attempts, :in_use, :value_percentage, :lesson_id, :number_of_answers)
    end
end
