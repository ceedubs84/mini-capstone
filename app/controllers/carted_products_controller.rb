class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.length > 0
      render 'index.html.erb'
    else
      flash[:warning] = "You don't have any items in your shopping cart. BUY SOME STUFF NOW!"
      redirect_to "/"
    end
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    flash[:success] = "Added to cart successfullly!"
    redirect_to "/carted_products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:success] = "Product removed!"
    redirect_to "/carted_products"
  end
  
end