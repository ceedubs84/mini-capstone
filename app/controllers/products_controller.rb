class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]
  
  def index
    only_show_discount = params[:discount] == "true"
    if only_show_discount
      @products = Product.where("price < ?", 10)
    elsif params[:category_name] != nil
      selected_category = Category.find_by(name: params[:category_name])
      @products = selected_category.products
    else
      sort_attribute = params[:sort] || "name"
      sort_order = params[:sort_order] || "asc"
      @products = Product.order(sort_attribute => sort_order)
    end
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
    )
    @product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render 'show.html.erb'
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image = params[:image]
    @product.price = params[:price]
    @product.save
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", '%' + search_term + '%')
    render 'index.html.erb'
  end
  
end
