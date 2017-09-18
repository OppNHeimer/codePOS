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
    @food = Food.new(food_params)
    @foods = Food.all
    if @food.save
      flash[:notice] = 'Ingredient added!'
      redirect_to foods_path
      return
    end
    render :index
  end



  #   @food = Food.create!(food_params).valid?
  #   redirect_to foods_path
  # end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = 'Ingredient updated'
      redirect_to foods_path
      return
    end
    render :edit
  end

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
