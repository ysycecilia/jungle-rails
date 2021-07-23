class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_AUTH_USERNAME"], password: ENV["ADMIN_AUTH_PASSWORD"], if: -> { request.subdomain == "admin" }
  
  def show
    @count_of_products = Product.count
    @count_of_categories = Category.count
  end
end
