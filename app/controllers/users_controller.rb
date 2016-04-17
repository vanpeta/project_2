class UsersController < ApplicationController
before_action(:set_user, only: [:edit, :update, :show])

  def new
    @user = User.new
  end
  def create
      @user = User.new(user_params)
      if @user.save
          flash[:success] = 'You are registered!'
          session[:user_id] = @user.id
          redirect_to home_path
      else
          flash[:error] = 'Registration has failed!'
          redirect_to new_user_path
      end
  end

  def edit
  end

  def update
   if  @user.update_attributes(user_params)
    flash[:success] = 'Profile updated'
    redirect_to my_profile_path
    else
      render 'edit'
    end
  end

  def show
    @activities = @user.activities
  end

  def my_profile
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
