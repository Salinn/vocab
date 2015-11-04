class CourseEmailsController < ApplicationController
  before_action :set_course_email, only: [:show, :edit, :update, :destroy]

  # GET /course_emails
  # GET /course_emails.json
  def index
    @course_emails = CourseEmail.all
  end

  # GET /course_emails/1
  # GET /course_emails/1.json
  def show
  end

  # GET /course_emails/new
  def new
    @course_email = CourseEmail.new
  end

  # GET /course_emails/1/edit
  def edit
  end

  # POST /course_emails
  # POST /course_emails.json
  def create
    @course_email = CourseEmail.new(course_email_params)

    respond_to do |format|
      if @course_email.save
        format.html { redirect_to @course_email, notice: 'Course email was successfully created.' }
        format.json { render :show, status: :created, location: @course_email }
      else
        format.html { render :new }
        format.json { render json: @course_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_emails/1
  # PATCH/PUT /course_emails/1.json
  def update
    respond_to do |format|
      if @course_email.update(course_email_params)
        format.html { redirect_to @course_email, notice: 'Course email was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_email }
      else
        format.html { render :edit }
        format.json { render json: @course_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_emails/1
  # DELETE /course_emails/1.json
  def destroy
    @course_email.destroy
    respond_to do |format|
      format.html { redirect_to course_emails_url, notice: 'Course email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_email
      @course_email = CourseEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_email_params
      params.require(:course_email).permit(:course_id, :title, :content)
    end
end
