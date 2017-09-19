class OrdersController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @order = Order.create!(item: @item.name)

    redirect_to category_item_path(@category, @item), notice: 'Item added to order'
  end
end