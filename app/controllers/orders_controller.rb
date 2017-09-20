class OrdersController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:item_id])
    @order = Order.create!(order_params)

    redirect_to category_item_path(@category, @item), notice: 'Item added to order'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:message).merge(item: @item.name, modification: @modifications)
  end
end
