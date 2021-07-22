class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    # raise @category.inspect  // will tell what category is used for dubugging
    @products = @category.products.order(created_at: :desc)
  end

end
