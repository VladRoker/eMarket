class OrdersController < ApplicationController

  def new
    redirect_to login_path unless current_user
    @order    = Order.new
    @user     = current_user || User.new(:name => 'Guest')
  end

  def create
    # create new order
    order = Order.new(price: 0.00,status: 'New')
    order.user = current_user
    if order.user.nil?
      redirect_to login_path
    else
      #calculate order.price
      @products = false
      @price = 0.00
      for prod, quan in cart # {:product_id.to_s => quantity:to_i }
        pro = Product.find(prod.to_i)
        order.products << pro
        @price = @price + pro.full_price * quan.to_i
        @products = true
      end
      order.price = @price
      if @products && order.save
        session[:products] = {} # clear cart
      end
      redirect_to root_path
    end
  end

end
