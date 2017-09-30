class ItemsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @items = @category.items.all
    @item = @category.items.new
  end

  def show
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @includes = @item.ingredients.all.sort_by{ |k| k["name"] }
    @ingredients = Ingredient.all.sort_by{ |k| k["name"] }


    # used for includes#create
    @include = @item.includes.new
    # used for orders#create
    @order = Order.new
  end

  def create
    @category = Category.find(params[:category_id])
    @items = @category.items.all
    @item = @category.items.new(item_params)
    if @item.save
      redirect_to category_items_path(@category), notice: 'Menu item created!'
    end
    render :index
  end

  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to category_item_path(@category, @item), notice: 'Menu item updated!'
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
