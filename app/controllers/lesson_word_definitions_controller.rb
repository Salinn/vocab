class LessonWordDefinitionsController < ApplicationController
  before_action :set_lesson_word_definition, only: [:destroy]
  load_and_authorize_resource

  def new
    @lesson_word_sentence = LessonWordDefinition.new
    @lesson_word = LessonWord.find(params[:lesson_word_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_word_sentence = LessonWordDefinition.new(lesson_word_definition_params)

    respond_to do |format|
      if @lesson_word_sentence.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @lesson_word_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson_word_sentence.destroy
    respond_to do |format|
      format.js
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_lesson_word_definition
    begin
      @course = Course.find(params[:course_id])
      @lesson = Lesson.find(params[:lesson_id])
      @lesson_word_sentence = LessonWordDefinition.find_by!(definition_id: params[:definition_id], lesson_word_id: params[:lesson_word_id])
    end
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def lesson_word_definition_params
    params.require(:lesson_word_definition).permit(:lesson_word_id, :definition_id)
  end
end
