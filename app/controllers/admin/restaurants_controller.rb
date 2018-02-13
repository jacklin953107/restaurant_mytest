class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_admin
  def index
    @restaurants = Restaurant.all
  end

  private
  def authenticate_admin
    #redirect_to root_path unless current_user.role == "admin"
    unless current_user.admin?
      flash[:alert] = "Not allow"
      redirect_to root_path
    end
  end
end
