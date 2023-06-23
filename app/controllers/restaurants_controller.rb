class RestaurantsController < ApplicationController
    def index
      restaurants = Restaurant.all
      render json: restaurants, only: [:id, :name, :address, :phone_number, :description]
    end
  
    def show
        @restaurant = Restaurant.find_by(id: params[:id])
    
        if @restaurant
          render json: @restaurant.to_json(include: { pizzas: { only: [:id, :name, :ingredients] } })
        else
          render json: { error: "Restaurant not found" }, status: :not_found
        end
      end
  
    def create
      restaurant = Restaurant.new(restaurant_params)
      if restaurant.save
        render json: restaurant, status: :created
      else
        render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        if restaurant.update(restaurant_params)
          render json: restaurant, status: :ok
        else
          render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end
  
    def destroy
      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        restaurant.destroy
        head :no_content
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end
  
    private
  
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :description)
    end
  end
  