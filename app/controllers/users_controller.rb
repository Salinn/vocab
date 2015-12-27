class UsersController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    course = Course.find(params[:user][:course_id])

    respond_to do |format|
      if @user.save
        CourseUser.create!(user_id: @user.id, course_id: course.id)
        UserMailer.add_to_class_email(@user).deliver_later
        current_user.add_role :student, course
        format.html { redirect_to course_path(course.id), notice: 'You have successfully registered.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to potentials_path, notice: "User deleted."
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end