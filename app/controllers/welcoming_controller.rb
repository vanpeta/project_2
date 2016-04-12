class WelcomingController < ApplicationController
  def show
    if current_user
      redirect_to home_path
    end
  end
end
