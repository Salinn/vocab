class GradeModfierController < ApplicationController
  before_action :set_grade_modfier, only: [:edit, :update]

  def new
    GradeModifer.new()
  end

  def create
    @grade_modifier = GradeModifer.new(grade_modfier_params)
    @grade_modifier.save!
  end

  def edit
  end

  def update
    @grade_modifier.update(grade_modfier_params)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def grade_modfier_params
    params.require(:definition).permit(:word_definition, :word_id)
  end

  def set_grade_modfier
    @definition = Definition.find(params[:id])
  end
end
