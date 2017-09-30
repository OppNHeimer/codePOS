class IngredientsController < ApplicationController
  # No need to add return after redirect_to
  def index
    @ingredients = Ingredient.all.sort_by{ |k| k["name"] }
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredients = Ingredient.all
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient added!'
    end
    render :index
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path, notice: 'Ingredient updated!'
    end
    render :edit
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to ingredients_path, notice: 'Ingredient deleted.'
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :code)
  end
end
