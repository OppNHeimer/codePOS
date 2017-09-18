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
      flash[:notice] = 'Ingredient added!'
      redirect_to foods_path
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
      flash[:notice] = 'Ingredient updated'
      redirect_to foods_path
      return
    end
    render :edit
  end

  # delete ingredient
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to foods_path
  end

  private
  def food_params
    params.require(:food).permit(:name, :code)
  end
end
