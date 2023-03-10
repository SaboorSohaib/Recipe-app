class RecipeFoodsController < ApplicationController
    before_action :find_recipe, only: %i[create, destroy]

    def index
        @foods = @user.foods
    end
    def new
        @foods = Food.all
        @recipe_food = RecipeFood.new
    end

    def create
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
        @recipe_food = RecipeFood.find(params[:id]).destroy
        respond_to do |format|
          format.html { redirect_to [@recipe.user, @recipe], notice: 'Ingredient has been successfully deleted.' }
        end
    end

    def find_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def recipe_food_params
      params.require(:recipe_food).permit(:quantity, :foods_id)
    end
end
