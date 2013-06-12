class ProductsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 3) #TODO: Add Pagination find here
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to root_url, notice: "Product has been successfully saved"
    else
      render "index"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
