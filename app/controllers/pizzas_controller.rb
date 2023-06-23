class PizzasController < ApplicationController
    def index
        pizzas = Pizza.all
        render json: pizzas, only: [:id, :name, :ingredients]
      end
end
def show
    pizza = Pizza.find_by(id: params[:id])
    if pizza
      render json: pizza, only: [:id, :name, :ingredients]
    else
      render json: { error: "Pizza not found" }, status: :not_found
    end
  end