class RecipesController < ApplicationController
    # GET /recipes
    def index
      @recipes = Recipe.all
    end
  end