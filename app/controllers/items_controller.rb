class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @ingredients = @item.ingredients.all
  end

  def new
  end

  def create
  end

  def exit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
  end
end
