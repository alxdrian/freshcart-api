class FoodsController < ApplicationController
    before_action :set_food, only: [:show]

    def index
        @foods = Food.all
        render json: @foods.map { |food|
          food.as_json.merge({ image: url_for(food.image) })
        }
    end

    def show
        render json: @food.as_json.merge({ image: url_for(@food.image) })
    end

    private

    def set_food
        @food = Food.find(params[:id])
    end
end
