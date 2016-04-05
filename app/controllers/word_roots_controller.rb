class WordRootsController < ApplicationController
  before_action :set_word_root, only: [:show, :edit, :update, :destroy]
  before_action :set_relationship, only: [:remove_relation, :add_relation]
  load_and_authorize_resource

  # GET /word_roots
  # GET /word_roots.json
  def index
     @search = WordRoot.ransack(params[:q])
     @word_roots = @search.result
  end

  # GET /word_roots/1
  # GET /word_roots/1.json
  def show
  end

  # GET /word_roots/new
  def new
    @word_root = WordRoot.new
    @word_roots = WordRoot.all
    @word = Word.find(params[:word_id])
  end

  # GET /word_roots/1/edit
  def edit
    @word = Word.find(params[:word_id])
  end

  # POST /word_roots
  # POST /word_roots.json
  def create
    @word_root = WordRoot.new(word_root_params)

    respond_to do |format|
      if @word_root.save
        format.html { redirect_to @word_root, notice: 'Word root was successfully created.' }
        format.json { render :show, status: :created, location: @word_root }
        format.js
      else
        format.html { render :new }
        format.json { render json: @word_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_roots/1
  # PATCH/PUT /word_roots/1.json
  def update
    respond_to do |format|
      if @word_root.update(word_root_params)
        format.html { redirect_to @word_root, notice: 'Word root was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_root }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @word_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_roots/1
  # DELETE /word_roots/1.json
  def destroy
    if !@word_root.destroy
      redirect_to action: "index"
    else
      respond_to do |format|
        format.html { redirect_to word_roots_url, notice: 'Word root was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      end
    end
  end

  # Removes a word roots assignment to a word
  def remove_relation
    @word.word_roots.delete(@word_root)
    respond_to do |format|
      format.js
    end
  end

  # Add the word_root relationship with the word
  def add_relation
    #add relation
    @word.word_roots.create(@word_root)
    respond_to do |format|
      format.js
    end
  end

  private

    def set_relationship
      #if request param id is null then we are using the specific id otherwise we are ok to the use the standard
      @word_root = (params[:id].nil?) ? WordRoot.find(params[:word_root_id]) : WordRoot.find(params[:id])
      @word = Word.find(params[:word_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_word_root
      @word_root = WordRoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_root_params
      params.require(:word_root).permit(:root_name, :root_definition)
    end
end
