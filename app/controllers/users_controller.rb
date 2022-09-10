class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    @saving = Saving.new
    @review = Review.new
    @posting = Posting.new
    authorize @user
  end
end
