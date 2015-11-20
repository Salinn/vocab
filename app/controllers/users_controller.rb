class UsersController < ApplicationController
  respond_to :html, :json

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    course = Course.find(params[:user][:course_id])
    raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = hashed_token
    @user.reset_password_sent_at = Time.now.utc
    @user.password = Devise.friendly_token.first(8)

    respond_to do |format|
      if @user.save
        @user.add_role(:student, course)
        UserMailer.add_to_class_email(course, @user, raw_token).deliver_later
        respond_with(course, location: root_path)
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