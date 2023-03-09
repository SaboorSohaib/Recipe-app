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
  end