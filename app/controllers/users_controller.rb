class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]
  
    # GET /users
    def index
      @users = User.all
    end

    # GET /users/new
    def new
      @user = User.new
     end

    # Use callbacks to share common setup
    def set_user
      @user = User.find(params[:id])
    end
  end
