class ProductsController < ApplicationController
  def index
    @product = Product.all.first
  end

  def show
    @product = Product.find_by_id(params[:id])
  end
end
