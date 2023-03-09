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
  end