class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id, only: [:add_role, :remove_role]
  load_and_authorize_resource
  respond_to :html, :json

  def new
    @user = User.new
  end

  def show
  end

  def create
    course = Course.find(params[:user][:course_id])
    @user =  User.find_by(email: params[:user][:email])
    @user = User.new(user_params) if @user.nil?

    @user.id.nil? ? @user.new_user_added_to_course(course) : @user.existing_user_added_to_course(course)

    respond_to do |format|
      if @user.save

        format.html { redirect_to course_manage_students_path(course), notice: 'You have successfully registered a student for your class.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_create
    @user =  User.find_by(email: params[:user][:email])
    @user = User.new(user_params) if @user.nil?
    @user.new_user_added_to_website(params[:user][:role])

    respond_to do |format|
      if @user.save
        format.html { redirect_to :back, notice: 'You have successfully registered a user for your the website.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_update_params)
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to potentials_path, notice: "User deleted."
  end

  def add_role
    @user.add_role(params[:user][:role])
    redirect_to :back
  end

  def remove_role
    @user.remove_role(params[:user][:role])
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_user_id
      @user = User.find(params[:user][:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :profile_picture, :remote_profile_picture)
    end
end