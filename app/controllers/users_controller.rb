class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
          flash[:success] = 'You are registered!'
          redirect_to root_path
      else
          flash[:error] = 'Registration has failed!'
          redirect_to new_user_path
      end
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
