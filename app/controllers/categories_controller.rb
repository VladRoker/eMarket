class CategoriesController < ApplicationController

  def index
    @categories = Category.roots
  end

  def show
    @category = Category.friendly.find params[:id]
  end
end
