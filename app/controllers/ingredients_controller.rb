class IngredientsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.find(params[:item_id])
    @ingredient = @item.ingredients.new
  end

  def create
    @item = Item.find(params[:item_id])

    @ingredient = @item.ingredients.create!(ingredient_params)


    redirect_to @item
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:food_id)
  end
end
