class WordVideosController < ApplicationController
  before_action :set_word_video, only: [:show, :edit, :update, :destroy]

  # GET /word_videos
  # GET /word_videos.json
  def index
    @word_videos = WordVideo.all
  end

  # GET /word_videos/1
  # GET /word_videos/1.json
  def show
  end

  # GET /word_videos/new
  def new
    @word_video = WordVideo.new
    @words = Word.all
  end

  # GET /word_videos/1/edit
  def edit
    @words = Word.all
  end

  # POST /word_videos
  # POST /word_videos.json
  def create
    @word_video = WordVideo.new(word_video_params)

    respond_to do |format|
      if @word_video.save
        format.html { redirect_to @word_video, notice: 'Word video was successfully created.' }
        format.json { render :show, status: :created, location: @word_video }
      else
        format.html { render :new }
        format.json { render json: @word_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_videos/1
  # PATCH/PUT /word_videos/1.json
  def update
    respond_to do |format|
      if @word_video.update(word_video_params)
        format.html { redirect_to @word_video, notice: 'Word video was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_video }
      else
        format.html { render :edit }
        format.json { render json: @word_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_videos/1
  # DELETE /word_videos/1.json
  def destroy
    @word_video.destroy
    respond_to do |format|
      format.html { redirect_to word_videos_url, notice: 'Word video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_video
      @word_video = WordVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_video_params
      params.require(:word_video).permit(:video_link, :video_description, :word_id)
    end
end
