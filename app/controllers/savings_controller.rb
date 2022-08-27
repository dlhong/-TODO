class SavingsController < ApplicationController
  before_action :set_saving, only: :destroy
  before_action :set_activity, only: %i[new create]

  def index
    @savings = Saving.where(user_id: current_user.id)
  end

  def new
    @saving = Saving.new
    # authorize @saving
  end

  def create
    @saving = Saving.new
    @saving.user = current_user
    @saving.activity = @activity
    if @saving.save
      redirect_to my_savings_path
    else
      render "activities/show"
    end
    # authorize @saving
  end

  def destroy
    @saving.destroy
    redirect_to my_savings_path
  end

  def edit
    @saving = Saving.find(params[:id])
  end

  def update
    @saving = Saving.find(params[:id])
    @saving.attendance = true
    if @saving.save
      redirect_to my_savings_path
    else
      render :new
    end
  end

  private

  def savings_params
    params.require(:saving).permit(:attendance)
  end

  def set_saving
    @saving = Saving.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
