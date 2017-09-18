class IngredientsController < ApplicationController

  # add ingredient to a menu item
  def create
    @item = Item.find(params[:item_id])
    @ingredient = @item.ingredients.create!(ingredient_params)

    redirect_to @item
  end

  # remove an ingredient from a menu item
  def destroy
    @item = Item.find(params[:item_id])
    @ingredient = Ingredient.find_by(item_id: params[:item_id], food_id: params[:ingredient_id])
    @ingredient.destroy

    redirect_to @item
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:food_id)
  end
end
