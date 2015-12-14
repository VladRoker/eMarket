class ProductsController < ApplicationController
  def show
    @product  = Product.find params[:id]
    @category = @product.category
  end

  def add
    to_cart(params[:id], params[:count])
    redirect_to :back
  end
end
