class CategoriesController < ApplicationController
  # No need to have comments that state what the method is doing unless the name is unclear.
  # Yours follow convention so no need!
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_items_path(@category), notice: 'Menu category created!'
    end
    render :index
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_items_path(@category), notice: 'Category updated!'
    end
    render :edit
  end

  def destroy
    @category = Category.find(params[:id])
    @items = @category.items.all
    # delete items in the category
    @items.each do |item|
      # deletes all includes of item
      @includes = item.includes.all
      @includes.each do |include|
        include.destroy
      end
      item.destroy
    end
    @category.destroy

    redirect_to categories_path, notice: 'Category deleted.'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
