class WordFormsController < ApplicationController
  before_action :set_word_form, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /word_forms
  # GET /word_forms.json
  def index
    @word_forms = WordForm.all
  end

  # GET /word_forms/1
  # GET /word_forms/1.json
  def show
  end

  # GET /word_forms/new
  def new
    @word_form = WordForm.new
    @word = Word.find(params[:word_id])
  end

  # GET /word_forms/1/edit
  def edit
    @words = Word.all
    @word = Word.find(params[:word_id])
  end

  # POST /word_forms
  # POST /word_forms.json
  def create
    @word_form = WordForm.new(word_form_params)

    respond_to do |format|
      if @word_form.save
        format.html { redirect_to @word_form, notice: 'Word form was successfully created.' }
        format.json { render :show, status: :created, location: @word_form }
        format.js
      else
        format.html { render :new }
        format.json { render json: @word_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_forms/1
  # PATCH/PUT /word_forms/1.json
  def update
    respond_to do |format|
      if @word_form.update(word_form_params)
        format.html { redirect_to @word_form, notice: 'Word form was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_form }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @word_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_forms/1
  # DELETE /word_forms/1.json
  def destroy
    @word_form.destroy
    respond_to do |format|
      format.html { redirect_to word_forms_url, notice: 'Word form was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_form
      @word_form = WordForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_form_params
      params.require(:word_form).permit(:associated_word, :word_id)
    end
end
