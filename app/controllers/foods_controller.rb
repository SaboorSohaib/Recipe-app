class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    redirect_to user_foods_index_path(user_id: @user.id) if @food.save
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
