class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_activity, only: %i[show]

  def index
    @activities = policy_scope(Activity)
    @activity = Activity.new
    authorize @activity
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def show
    @saving = Saving.new
    @review = Review.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
    authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:summary, :name, :address, :contact_info, :price)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
