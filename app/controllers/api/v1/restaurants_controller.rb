class Api::V1::RestaurantsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :find_restaurant, only: [:show, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
  end


private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :description, :image, :address)
  end

end
