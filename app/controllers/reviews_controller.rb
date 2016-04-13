class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.activity = Activity.find(params[:activity_id])



    if @review.save
   redirect_to activity_path(Activity.find(params[:activity_id]))
    end

  end

  def show

  end
  private
  def review_params
    params.require(:review).permit(:content, :user, :activity)
  end

end
