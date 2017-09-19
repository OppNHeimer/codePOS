class IngredientsController < ApplicationController

  # index of all ingredients
  def index
    @ingredients = Ingredient.all.sort_by{ |k| k["name"] }
    @ingredient = Ingredient.new
  end

  def show
  end

  def new
  end

  # add ingredient to list
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredients = Ingredient.all
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient added!'
      return
    end
    render :index
  end

  # edit ingredient
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # update ingredient
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path, notice: 'Ingredient updated!'
      return
    end
    render :edit
  end

  # delete ingredient
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
