class ItemsController < ApplicationController
  # index of all menu items
  def index
    @category = Category.find(params[:category_id])
    @items = @category.items.all
    @item = @category.items.new
  end

  # menu item show page
  def show
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @includes = @item.ingredients.all

    # used for includes#create
    @include = @item.includes.new
  end

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.new
  end

  # create new menu item
  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(item_params)
    if @item.save
      redirect_to category_item_path(@category, @item), notice: 'Menu item created!'
      return
    end
    render :new
  end

  # edit menu item
  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  # update menu item
  def update
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to category_item_path(@category, @item), notice: 'Menu item updated!'
      return
    end
    render :edit
  end

  # delete menu item
  def destroy
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @includes = @item.includes.all
    @includes.each do |include|
      include.destroy
    end
    @item.destroy

    redirect_to category_items_path(@category), notice: 'Menu item deleted.'
  end

  private
  def item_params
    params.require(:item).permit(:name, :code)
  end
end
