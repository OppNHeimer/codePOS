class FoodsController < ApplicationController

  # index of all ingredients
  def index
    @foods = Food.all
    @food = Food.new
  end

  def show
  end

  def new
  end

  # add ingredient to list
  def create
    @food = Food.new(food_params)
    @foods = Food.all
    if @food.save
      redirect_to foods_path, notice: 'Ingredient added!'
      return
    end
    render :index
  end

  # edit ingredient
  def edit
    @food = Food.find(params[:id])
  end

  # update ingredient
  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path, notice: 'Ingredient updated!'
      return
    end
    render :edit
  end

  # delete ingredient
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to foods_path, notice: 'Ingredient deleted.'
  end

  private
  def food_params
    params.require(:food).permit(:name, :code)
  end
end
