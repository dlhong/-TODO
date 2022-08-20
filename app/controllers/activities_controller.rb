class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    #authorize @posting
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
    #authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:summary, :name, :address, :contact_info, :price)
  end

end
