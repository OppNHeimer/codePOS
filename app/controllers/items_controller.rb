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

  def add_ingredient
    @item = Item.find(params[:id])
    @ingredient = @item.ingredients.create!(:food)
  end

  def create
    @item = Item.create!(item_params)
    redirect_to @item
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def remove_ingredient
    @item = Item.find(params[:item_id])
    @ingredient = @item.ingredients.find(params[:id])
    @item.ingredients.delete(@ingredient)

    # @ingredient = Item.Ingredient.find_by(item_id: params[:item_id], food_id: food.id)
    # @ingredient.destroy
    redirect_to :back
  end

  private
  def item_params
    params.require(:item).permit(:name, :code, :category)
  end
end
