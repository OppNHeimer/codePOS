class FoodsController < ApplicationController

  def index
    @foods = Food.all
    @food = Food.new
  end

  def show
  end

  def new
  end

  def create
    @food = Food.create!(food_params)
    redirect_to foods_path
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update!(food_params)

    redirect_to foods_path
  end

  def destroy
  end

  private
  def food_params
    params.require(:food).permit(:name, :code)
  end
end
