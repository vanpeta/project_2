class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
    @organizer = @activity.user
    @review = Review.new
    @comments = @activity.reviews
  end

  def create
    @activity = Activity.new(activities_params)
    @activity.user = current_user

    if @activity.save
      redirect_to my_activities_path
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.user == current_user
      @activity.update_attributes(activities_params)
        redirect_to my_activities_path
    else
        render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to home_path
  end

  def my_activities
    @activities = current_user.activities
  end

  private
  def activities_params
    params.require(:activity).permit(:name, :description, :location, :date, :time, :duration, :user)
  end

end


