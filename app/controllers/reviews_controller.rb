class ReviewsController < ApplicationController
  before_action :set_review, only: :destroy
  before_action :set_activity, only: %i[new create]

  def new
    @review = Review.new
    @activity = Activity.new
    # authorize @review
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user
    @review.activity = @activity
    if @review.save
      redirect_to activity_path(@activity), notice: "Review Successfully Created"
    else
      flash.alert = "Review has not been saved, please confirm that you have filled in all the fields"
      redirect_to activity_path(@activity)
    end
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to my_savings_path
  end

  private

  def reviews_params
    params.require(:review).permit(:ratings, :content, :title)
  end

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
