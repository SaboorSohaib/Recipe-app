class RecipeFoodsController < ApplicationController
    def index
        @foods = @user.foods
    end
    def new
        @foods = Food.all
        @recipe_food = RecipeFood.new
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
        if @recipe_food.save
          flash[:notice] = 'New Food Recipe Has Been Succesfully  added.'
          redirect_to [@recipe.user, @recipe]
        else
          redirect_to [@recipe.user, @recipe]
          flash[:alert] = 'New Food Recipe Failed To Add'
        end
    end

    def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = RecipeFood.find(params[:id]).destroy
        respond_to do |format|
          format.html { redirect_to [@recipe.user, @recipe], notice: 'Ingredient was successfully deleted.' }
        end
    end

    def recipe_food_params
      params.require(:recipe_food).permit(:foods_id, :quantity)
    end
end
