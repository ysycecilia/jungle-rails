class CategoriesController < ApplicationController

  def show
    # find only works with ID, and returns a single entity
    # .where(color: 'black'): gives all
    # .find_by(color: 'black'): gives first result
    @category = Category.find(params[:id])
    # raise @category.inspect  // will tell what category is used for dubugging
    @products = @category.products.order(created_at: :desc)
  end

end
