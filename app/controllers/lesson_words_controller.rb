class LessonWordsController < ApplicationController
  before_action :set_lesson_words, only: [:edit, :update, :destroy]

  # GET /lesson_words/new
  def new
    @lesson_word = LessonWord.new
    @words = Word.all
  end

  # GET /lesson_words/1/edit
  def edit
    @words = Word.all
  end

  # POST /lesson_words
  # POST /lesson_words.json
  def create
    @lesson_word = LessonWord.new(lesson_words_params)

    respond_to do |format|
      if @lesson_word.save
        format.html { redirect_to @course, notice: 'Lesson successfully added the word.' }
        format.json { render :back, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_words/1
  # PATCH/PUT /lesson_words/1.json
  def update
    respond_to do |format|
      if @course.update(lesson_words_params)
        format.html { redirect_to @course, notice: 'Lesson successfully updated the word.' }
        format.json { render :back, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_words/1
  # DELETE /lesson_words/1.json
  def destroy
    @lesson_word.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Lesson successfully deleted the word.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_words
    @lesson_word = LessonWord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lesson_words_params
    params.require(:lesson_word).permit(:lesson, :word)
  end
end