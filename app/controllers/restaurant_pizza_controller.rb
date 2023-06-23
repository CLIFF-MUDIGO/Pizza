class RestaurantPizzasController < ApplicationController
    def create
      restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)
      if restaurant_pizza.save
        render json: restaurant_pizza, status: :created
      else
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      restaurant_pizza = RestaurantPizza.find_by(id: params[:id])
      if restaurant_pizza
        if restaurant_pizza.update(restaurant_pizza_params)
          render json: restaurant_pizza, status: :ok
        else
          render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "RestaurantPizza not found" }, status: :not_found
      end
    end
  
    def destroy
      restaurant_pizza = RestaurantPizza.find_by(id: params[:id])
      if restaurant_pizza
        restaurant_pizza.destroy
        head :no_content
      else
        render json: { error: "RestaurantPizza not found" }, status: :not_found
      end
    end
  
    private
  
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:restaurant_id, :pizza_id, :price, :special_instructions)
    end
  end
  