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

  def edit
    @review = this_review
  end

    def update
    @review = this_review
    if @review.user == current_user
      @review.update_attributes(review_params)
        redirect_to activity_path (Activity.find(this_review.activity_id))
    else
        render :edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :user, :activity)
  end
  def this_review
    Review.find(params[:id])
  end

end
