class SavingsController < ApplicationController
  before_action :set_saving, only: :destroy
  before_action :set_activity, only: %i[new create]

  def index
    @savings = policy_scope(Saving).where(user_id: current_user.id)
    # @saving = Saving.new
    @user = current_user
    @posting = Posting.new
    @postings = policy_scope(Posting).where(user_id: current_user.id)
  end

  def new
    @saving = Saving.new
    authorize @saving
  end

  def create
    @saving = Saving.new
    @saving.user = current_user
    @saving.activity = @activity
    @review = Review.new
    if @saving.save
      redirect_to my_savings_path
    else
      flash.alert = "It has been saved before"
      render "activities/show"
    end
    authorize @saving
    authorize @activity
  end

  def destroy
    @saving.destroy
    redirect_to my_savings_path
    authorize @saving
  end

  def edit
    @saving = Saving.find(params[:id])
    authorize @saving
  end

  def update
    @saving = Saving.find(params[:id])
    @saving.attendance = !@saving.attendance
    if @saving.save
      redirect_to my_savings_path
    else

      render :new
    end
    authorize @saving
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
