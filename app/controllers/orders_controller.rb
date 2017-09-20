class OrdersController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @order = Order.create!(order_params)
    $modifications = []

    redirect_to category_item_path(@category, @item), notice: 'Item added to order'
  end

  def without
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @ingredient = Ingredient.find(params[:include_id])
    $modifications.push('NO ' + @ingredient.name)

    redirect_to category_item_path(@category, @item), notice: 'Without ingredient'
  end

  def remove_without
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @ingredient = Ingredient.find(params[:include_id])
    $modifications.delete('NO ' + @ingredient.name)

    redirect_to category_item_path(@category, @item)
  end

  def add
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @ingredient = Ingredient.find(params[:include_id])
    $modifications.push('ADD ' + @ingredient.name)

    redirect_to category_item_path(@category, @item), notice: 'Add ingredient'
  end

  def remove_add
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @ingredient = Ingredient.find(params[:include_id])
    $modifications.delete('ADD ' + @ingredient.name)

    redirect_to category_item_path(@category, @item)
  end


  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:message).merge(item: @item.name, modification: $modifications)
  end
end
