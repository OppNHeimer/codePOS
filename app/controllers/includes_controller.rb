class IncludesController < ApplicationController

  # add include to a menu item
  def create
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:item_id])
    @include = @item.includes.create!(include_params)

    redirect_to @item
  end

  # remove an include from a menu item
  def destroy
    @item = Item.find(params[:item_id])
    @include = Include.find_by(item_id: params[:item_id], ingredient_id: params[:include_id])
    @include.destroy

    redirect_to @item
  end

  private
  def include_params
    params.require(:include).permit(:ingredient_id)
  end
end
