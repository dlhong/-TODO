class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_activity, only: %i[show]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    # authorize @posting
  end

  def show
    @saving = Saving.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
    # authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:summary, :name, :address, :contact_info, :price)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
