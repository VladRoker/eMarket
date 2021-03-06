class AdminsController < ApplicationController
  before_action :test_access
  def index
    @products       = Product.all.order(:counter_cache).limit(5)
    @users          = Impression.distinct.pluck('session_hash').count
    @registrations  = User.where('created_at >= ?', 1.week.ago).count
    @orders         = Order.where('created_at >= ?', 1.week.ago).count
    @lefties        = Impression.where("controller_name == 'products' AND action_name == 'add'").pluck('session_hash').count # Carts that have been left behind
  end

  def new_contact
    @contact = Contact.new
  end

  def contacts
    @contacts = Contact.all
  end

  def coupons
    @coupons = Coupon.all
  end

  def coupon
    @coupon = Coupon.find params[:id]
  end

  def new_coupon
    @save = 10 ### Backup system (just in case of large amount of unlucky tries)
    begin
      @random = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      @random = (0...24).map { @random[rand(@random.length)] }.join.scan(/.{6}|.+/).join('-')
      @save -= 1
      if @save < 0
        break
      end
    end while !(Coupon.find_by_code(@random).nil?)
    @coupon = Coupon.new(:code => @random)
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

  def orders
    @orders = Order.all
  end

  def order
    @order = Order.find params[:id]
  end

  def create
    if params[:product]
      product = Product.new(params.require(:product).permit(:name, :price, :discount, :sale_flag, :description, :category_id, :quantity, :image, :slug_en))
      if product
        product.save!
      end
      redirect_to admin_product_page_path(product.id || '0')
    elsif params[:category]
      category = Category.new(params.require(:category).permit(:name, :description, :ancestry, :slug_en))
      if category
        category.save!
      end
      redirect_to admin_category_page_path(category.id || '0')
    elsif params[:coupon]
      coupon = Coupon.new(params.require(:coupon).permit(:code, :amount, :percent))
      if coupon
        coupon.save!
      end
      redirect_to admin_path
    elsif params[:delivery]
      render :json => params[:delivery]
    elsif params[:contact]
      contact = Contact.new(params.require(:contact).permit(:language, :name, :adress, :phone, :email, :company_name, :company_reg_nr, :company_vat_nr, :bank, :time_table, :description))
      if contact
        contact.save!
      end
      redirect_to admin_contacts_path
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
    elsif params[:type] == 'contact'
      Contact.find(params[:id]).delete
      redirect_to admin_contacts_path
    elsif params[:type] == 'coupon'
      Coupon.find(params[:id]).delete
      redirect_to admin_coupons_path
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
      order = Order.find(params[:order][:id])
      if order
        order.update_attributes(params.require(:order).permit(:price, :status))
      end
      redirect_to admin_order_page_path(params[:order][:id] || '0')
    elsif params[:product]
      product = Product.find(params[:product][:id])
      if product
        product.update_attributes(params.require(:product).permit(:name, :price, :discount, :sale_flag, :description, :category_id, :quantity, :image, :slug_en))
      end
      redirect_to admin_product_page_path(params[:product][:id] || '0')
    elsif params[:category]
      category = Category.find(params[:category][:id])
      if category
        category.update_attributes(params.require(:category).permit(:name, :description, :ancestry, :slug_en))
      end
      redirect_to admin_category_page_path(params[:category][:id] || '0')
    elsif params[:coupon]
      coupon = Coupon.find_by_code params[:coupon][:code]
      if coupon
        coupon.update_attributes(params.require(:coupon).permit(:code, :amount, :percent))
      end
      redirect_to admin_coupon_page_path(coupon.id)
    elsif params[:delivery]
      render :json => params[:delivery]
    elsif params[:contact]
      contact = Contact.find(params[:contact][:id])
      if contact
        contact.update_attributes(params.require(:contact).permit(:language, :name, :adress, :phone, :email, :company_name, :company_reg_nr, :company_vat_nr, :bank, :time_table, :description))
      end
      redirect_to admin_contacts_path
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
