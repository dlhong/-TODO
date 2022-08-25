class ReviewsController < ApplicationController
  before_action :set_review, only: :destroy
  before_action :set_activity, only: %i[new create]

  def new
    @review = Review.new
    # authorize @review
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user
    @review.activity = @activity
    if @review.save
      redirect_to my_reviews_path
    else
      render "reviews/show"
    end
    # authorize @review
  end

  def destroy
    @review.destroy
    redirect_to activity_path(@review.activity)
  end

  private

  def reviews_params
    params.require(:review).permit(:ratings, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
