class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_activity, only: %i[show]

  def index
    @activity = Activity.new
    if params[:query].present?
      @activities = policy_scope(Activity).search_by_attr(params[:query])
    else
      @activities = policy_scope(Activity)
    end
    markers
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
    params.require(:activity).permit(:summary, :name, :address, :contact_info, :price, :image)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def markers
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity })
      }
    end
  end
end
