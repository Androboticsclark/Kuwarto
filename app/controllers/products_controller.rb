class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  def create
    @product = Product.new(user_params)
    if @product.save
      flash[:success] = 'Posted Successfully!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(user_params)
      flash[:success] = "Updated Successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :city, :barangay, :bathrooms, :condition, :area, :neighborhood)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
