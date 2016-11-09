class ProductsController < ApplicationController
  def one_product_method

    render 'one_product.html.erb'
  end

  def all_product_method
    render 'all_product.html.erb'
  end
end
