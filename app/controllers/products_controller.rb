class ProductsController < ApplicationController
  def show
    @product  = Product.friendly.find params[:id]
    @category = @product.category
    @comments = @product.comments
  end

  def add
    to_cart(params[:id], params[:count])
    redirect_to :back
  end
end
