class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @products = Product.all
    @total_products = @products.count

    @categories = Category.all
    @total_categories = @categories.count
  end
end
