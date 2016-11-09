class ProductsController < ApplicationController
  def one_product_method
    @product = Product.first
    render 'one_product.html.erb'
  end

  def all_product_method
    @products = Product.all
    render 'all_product.html.erb'
  end
end
