class RecipeFoodsController < ApplicationController
    def new
        @recipe_food = RecipeFood.new
        @foods = Food.all
    end

    def create

    end
end
