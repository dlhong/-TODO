class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @activities = Activity.first(6)
  end

  def index
  end
end
