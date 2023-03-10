class RecipesController < ApplicationController

  before_action :current_user, only: %i[index, show]
  
  # GET /recipes
  def index
    @recipes = @user.recipes
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @foods = @user.foods
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'New Recipe has been successfuly created.'
      redirect_to [@recipe.user, @recipe]
    else
      redirect_to [:new_user_recipe]
      flash[:alert] = 'New recipe creation failed'
    end
  end

  # DELETE /recipes/1
  def destroy
    recipe = Recipe.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to [current_user, :recipes], notice: 'The Recipe has been successfully deleted.' }
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  # Use callbacks to share common setup
  def current_user
    @user = current_user
  end
end
