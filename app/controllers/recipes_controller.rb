class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show; end

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
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
