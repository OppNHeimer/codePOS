class ItemsController < ApplicationController
  # index of all menu items
  def index
    @items = Item.all
  end

  # menu item show page
  def show
    @item = Item.find(params[:id])
    @ingredients = @item.ingredients.all

    # used for ingredients#create
    @ingredient = @item.ingredients.new
  end

  def new
    @item = Item.new
  end

  # create new menu item
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: 'Menu item created!'
      return
    end
    render :new
  end

  # edit menu item
  def edit
    @item = Item.find(params[:id])
  end

  # update menu item
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item, notice: 'Menu item updated!'
      return
    end
    render :edit
  end

  # delete menu item
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, notice: 'Menu item deleted.'
  end

  private
  def item_params
    params.require(:item).permit(:name, :code, :category)
  end
end
