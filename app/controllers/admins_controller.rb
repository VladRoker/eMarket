class AdminsController < ApplicationController
  before_action :test_access
  def index
  end

  def users
    @users = User.all
  end

  def user
    @user = User.find(params[:id] || '0')
  end

  def categories_index
    # ApplicationController#categories should not be redefined
    render 'categories'
  end

  def category
    @cat = Category.find(params[:id] || '0')
    @ancestry = [Category.new] + categories - [@cat]
  end

  def new_category
    @cat = Category.new
    @ancestry = [Category.new] + categories
  end

  def products
    @products = Product.all
  end

  def product
    @product = Product.find(params[:id] || '0')
  end

  def new_product
    @product = Product.new
  end

  def create
    if params[:order]
      render :json => params[:order]
    elsif params[:product]
      product = Product.new(params.require(:product).permit(:name, :price, :discount, :sale_flag, :description, :category_id, :quantity))
      if product
        product.save!
      end
      redirect_to admin_product_page_path(product.id || '0')
    elsif params[:category]
      category = Category.new(params.require(:category).permit(:name, :description, :ancestry))
      if category
        category.save!
      end
      redirect_to admin_category_page_path(category.id || '0')
    elsif params[:cupon]
      render :json => params[:cupon]
    elsif params[:delivery]
      render :json => params[:delivery]
    else
      render :text => 'nil'
    end
  end

  def delete
    if params[:type] == 'category'
      Category.find(params[:id]).delete
      redirect_to admin_categories_path
    elsif params[:type] == 'product'
      Product.find(params[:id]).delete
      redirect_to admin_product_path
    else
      redirect_to admin_path
    end
  end

  def update
    if params[:user]
      user = User.find(params[:user][:id])
      if user
        user.update_attributes(params.require(:user).permit(:name, :email, :admin_flag))
      end
      redirect_to admin_user_page_path(params[:user][:id] || '0')
    elsif params[:order]
      render :json => params[:order]
    elsif params[:product]
      product = Product.find(params[:product][:id])
      if product
        product.update_attributes(params.require(:product).permit(:name, :price, :discount, :sale_flag, :description, :category_id, :quantity))
      end
      redirect_to admin_product_page_path(params[:product][:id] || '0')
    elsif params[:category]
      category = Category.find(params[:category][:id])
      if category
        category.update_attributes(params.require(:category).permit(:name, :description, :ancestry))
      end
      redirect_to admin_category_page_path(params[:category][:id] || '0')
    elsif params[:cupon]
      render :json => params[:cupon]
    elsif params[:delivery]
      render :json => params[:delivery]
    elsif params[:info]
      render :json => params[:info]
    else
      render :text => 'nil'
    end
  end

  private
  def test_access
    unless current_user && current_user.admin?
      render :file => "public/401.html", :status => :unauthorized, :layout => false
    end
  end
end