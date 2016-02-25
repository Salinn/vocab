class LessonWordDefinitionsController < ApplicationController
  before_action :set_lesson_word_definition, only: [:destroy]
  load_and_authorize_resource

  def new
    @lesson_word_definition = LessonWordDefinition.new
    @lesson_word = LessonWord.find(params[:lesson_word_id])
  end

  def create
    @lesson_word_definition = LessonWordDefinition.new(lesson_word_definition_params)

    respond_to do |format|
      if @lesson_word_definition.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @lesson_word_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson_word_definition.destroy
    respond_to do |format|
      format.js
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_lesson_word_definition
    @lesson_word_definition = LessonWordDefinition.find_by!(definition_id: params[:definition_id], lesson_word_id: params[:lesson_word_id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def lesson_word_definition_params
    params.require(:lesson_word_definition).permit(:lesson_word_id, :definition_id)
  end
end
