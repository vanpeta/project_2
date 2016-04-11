class WelcomingController < ApplicationController
  def show
    if current_user
      redirect_to activities_path
    end
  end
end
