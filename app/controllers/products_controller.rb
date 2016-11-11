class ProductsController < ApplicationController
  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def index
    @products = Product.all
    render 'index.html.erb'
  end
end
