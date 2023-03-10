class RecipeFoodsController < ApplicationController
    def new
        @recipe_food = RecipeFood.new
        @foods = Food.all
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id],
                                      quantity:
                                      params.require(:recipe_food).permit(:quantity)[:quantity], food_id:
                                        params.require(:recipe_food).permit(:food_id)[:food_id])
    
        if @recipe_food.save
          redirect_to user_recipe_path(params[:user_id], params[:recipe_id])
        else
          render :new
        end
    end

    def destroy
        
    end
end
