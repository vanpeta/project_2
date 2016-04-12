class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params.require(:review).permit(:content, :user, :activity))
    @review.user = current_user
    @review.activity = current_activity

    if @review.save
      redirect_to activity_path(activity)
    end

  end

end
