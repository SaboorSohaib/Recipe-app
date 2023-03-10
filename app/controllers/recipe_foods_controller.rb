class RecipeFoodsController < ApplicationController
    def new
        @foods = Food.all
        @recipe_food = RecipeFood.new
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id],
                                      quantity:
                                      params.require(:recipe_food).permit(:quantity)[:quantity], food_id:
                                        params.require(:recipe_food).permit(:food_id)[:food_id])
    
        if @recipe_food.save
          flash[:notice] = 'New Recipe_Food was successfully created'
          redirect_to user_recipe_path(params[:user_id], params[:recipe_id])
        else
          render :new
        end
    end

    def destroy
        @recipe_food = RecipeFood.find(params[:id]).destroy
        flash[:notice] = 'The Recipe_Food was successfully deleted'
        redirect_to user_recipe_path(params[:user_id], params[:recipe_id])
    end
end
