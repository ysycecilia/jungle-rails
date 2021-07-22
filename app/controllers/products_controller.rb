class ProductsController < ApplicationController

  def index
    # use model to fetch data
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
