class LessonWordsController < ApplicationController
  before_action :set_lesson_word, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /lessons
  # GET /lessons.json
  def index
    @lesson_words = LessonWord.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson_word.lesson_word_definitions.build
    @lesson_word.lesson_word_videos.build
    @lesson_word.lesson_word_sentences.build
    @lesson_word.lesson_word_forms.build
    @lesson_word.lesson_word_synonyms.build
  end

  # GET /lessons/new
  def new
    @lesson_word = LessonWord.new
    @lesson_word.lesson_word_definitions.build
    @lesson_word.lesson_word_videos.build
    @lesson_word.lesson_word_sentences.build
    @lesson_word.lesson_word_forms.build
    @lesson_word.lesson_word_synonyms.build
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = LessonWord.new(lesson_word_params)

    respond_to do |format|
      if @lesson_word.save
        format.html { redirect_to @lesson_word, notice: 'Lesson word was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_word }
      else
        format.html { render :new }
        format.json { render json: @lesson_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson_word.update(lesson_word_params)
        format.html { redirect_to @lesson_word, notice: 'Lesson word was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_word }
      else
        format.html { render :show }
        format.json { render json: @lesson_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson_word.destroy
    respond_to do |format|
      format.html { redirect_to lesson_words_url, notice: 'Lesson word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_word
    @lesson_word = LessonWord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lesson_word_params
    params.require(:lesson_word).permit(lesson_word_definitions_attributes: [:lesson_word_id, :definition_id],
                                        lesson_word_videos_attributes: [:lesson_word_id, :word_video_id],
                                        lesson_word_sentences_attributes: [:lesson_word_id, :sentence_id],
                                        lesson_word_forms_attributes: [:lesson_word_id, :word_form_id],
                                        lesson_word_synonyms_attributes: [:lesson_word_id, :synonym_id])
  end
end
