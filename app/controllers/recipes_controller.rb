class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:notice] = 'New Recipe was successfully created'
      redirect_to user_recipes_path(params[:user_id])
    else
      render :new
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    flash[:notice] = 'The Recipe was successfully removed'
    redirect_to user_recipes_path(params[:user_id])
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  # Use callbacks to share common setup
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
