class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
    association_build
  end

  # GET /words/1/edit
  def edit
    association_build
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        update_word_roots
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        update_word_roots
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def association_build
      @word.word_videos.build
      @word.sentences.build
      @word.definitions.build
      @word.synonyms.build
      @word.word_forms.build
    end
    #Creates / Updates root relations
    def update_word_roots
      word_root_ids = params[:word][:word_root_ids]
      @word.word_roots.each do |word_root|
        @word.word_roots.delete(word_root) unless word_root_ids.include? word_root.id
      end
      word_root_ids.each do |word_root_id|
        RootManager.find_or_create_by(word_id: @word.id, word_root_id: word_root_id)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:name, :word_root_ids, word_videos_attributes: [:word_id, :video_link, :video_description],
                                          sentences_attributes: [:word_id, :word_sentence],
                                          definitions_attributes: [:word_id, :word_definition],
                                          synonyms_attributes: [:word_id, :word_synonym],
                                          word_forms_attributes: [:word_id, :associated_word])
    end
end
