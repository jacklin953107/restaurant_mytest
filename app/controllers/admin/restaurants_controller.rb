class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_admin
  def index
    @restaurants = Restaurant.all
  end
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "餐廳成功建立"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "餐廳建立失敗"
      render :new
    end
  end

  private
  def authenticate_admin
    #redirect_to root_path unless current_user.role == "admin"
    unless current_user.admin?
      flash[:alert] = "Not allow"
      redirect_to root_path
    end
  end
  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end
end
