class PostingsController < ApplicationController

  def index
    @postings = policy_scope(Posting).where(user_id: current_user.id)
    @user = current_user
    @saving = Saving.new
  end

  def new
    @posting = Posting.new
    authorize @posting
  end

  def create
    @posting = Posting.new(postings_params)
    @posting.user = current_user
    if @posting.save
      redirect_to my_savings_path
    end
    authorize @posting
  end

  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy
    redirect_to my_savings_path
    authorize @posting
  end

  def edit
    @posting = Posting.find(params[:id])
    authorize @posting
  end

  def update
    @posting = Posting.find(params[:id])
    if @posting.save
      redirect_to my_savings_path
    else
      render :new
    end
    authorize @posting
  end

  private

  def postings_params
    params.require(:posting).permit(:content)
  end
end
