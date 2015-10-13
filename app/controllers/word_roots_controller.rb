class WordRootsController < ApplicationController
  before_action :set_word_root, only: [:show, :edit, :update, :destroy]

  # GET /word_roots
  # GET /word_roots.json
  def index
    @word_roots = WordRoot.all
  end

  # GET /word_roots/1
  # GET /word_roots/1.json
  def show
  end

  # GET /word_roots/new
  def new
    @word_root = WordRoot.new
  end

  # GET /word_roots/1/edit
  def edit
  end

  # POST /word_roots
  # POST /word_roots.json
  def create
    @word_root = WordRoot.new(word_root_params)

    respond_to do |format|
      if @word_root.save
        format.html { redirect_to @word_root, notice: 'Word root was successfully created.' }
        format.json { render :show, status: :created, location: @word_root }
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
      else
        format.html { render :edit }
        format.json { render json: @word_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_roots/1
  # DELETE /word_roots/1.json
  def destroy
    @word_root.destroy
    respond_to do |format|
      format.html { redirect_to word_roots_url, notice: 'Word root was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_root
      @word_root = WordRoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_root_params
      params.require(:word_root).permit(:root_name, :root_definition)
    end
end
