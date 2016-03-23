class LessonWordSynonymsController < ApplicationController
  before_action :set_lesson_word_synonym, only: [:destroy]
  load_and_authorize_resource

  def new
    @lesson_word_synonym = LessonWordSynonym.new
    @lesson_word = LessonWord.find(params[:lesson_word_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_word_synonym = LessonWordSynonym.new(lesson_word_synonym_params)

    respond_to do |format|
      if @lesson_word_synonym.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @lesson_word_synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson_word_synonym.destroy
    respond_to do |format|
      format.js
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_lesson_word_synonym
    begin
      @course = Course.find(params[:course_id])
      @lesson = Lesson.find(params[:lesson_id])
      @lesson_word_synonym = LessonWordSynonym.find_by!(synonym_id: params[:synonym_id], lesson_word_id: params[:lesson_word_id])
    end
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def lesson_word_synonym_params
    params.require(:lesson_word_synonym).permit(:lesson_word_id, :synonym_id)
  end
end
