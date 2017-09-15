class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @ingredients = @item.ingredients.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(item_params)
    redirect_to @item
  end

  def exit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :code, :category)
  end
end
