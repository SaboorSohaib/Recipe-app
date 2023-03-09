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
  
      respond_to do |format|
        if @recipe.save
          format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
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