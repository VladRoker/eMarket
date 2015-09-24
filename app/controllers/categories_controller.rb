class CategoriesController < ApplicationController

  def index
    @categories = Category.roots
  end

  def show
    @category = Category.find params[:id]
  end
end
