class LessonExtensionsController < ApplicationController
  before_action :set_lesson_extension, only: [:show, :edit, :update, :destroy]

  # GET /lesson_extensions
  # GET /lesson_extensions.json
  def index
    @lesson_extensions = LessonExtension.all
  end

  # GET /lesson_extensions/1
  # GET /lesson_extensions/1.json
  def show
  end

  # GET /lesson_extensions/new
  def new
    @lesson_extension = LessonExtension.new
  end

  # GET /lesson_extensions/1/edit
  def edit
  end

  # POST /lesson_extensions
  # POST /lesson_extensions.json
  def create
    @lesson_extension = LessonExtension.new(lesson_extension_params)

    respond_to do |format|
      if @lesson_extension.save
        format.html { redirect_to @lesson_extension, notice: 'Lesson extension was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_extension }
      else
        format.html { render :new }
        format.json { render json: @lesson_extension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_extensions/1
  # PATCH/PUT /lesson_extensions/1.json
  def update
    respond_to do |format|
      if @lesson_extension.update(lesson_extension_params)
        format.html { redirect_to @lesson_extension, notice: 'Lesson extension was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_extension }
      else
        format.html { render :edit }
        format.json { render json: @lesson_extension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_extensions/1
  # DELETE /lesson_extensions/1.json
  def destroy
    @lesson_extension.destroy
    respond_to do |format|
      format.html { redirect_to lesson_extensions_url, notice: 'Lesson extension was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_extension
      @lesson_extension = LessonExtension.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_extension_params
      params.require(:lesson_extension).permit(:lesson_id, :user_id, :extension_date)
    end
end
