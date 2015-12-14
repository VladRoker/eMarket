class OrdersController < ApplicationController

  def new
    @order    = Order.new
    @user     = current_user || User.new
  end

  def create
    # create new order
    order = Order.new(price: 0.00,status: 'new')
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

# private

#   def get_current_user(user)
#     @db_user = User.find_by :email => user.email
#     if @db_user.nil? # User does not exist
#       user.save ? (login(user); return current_user) : (return false)
#     else # user already exists! Things go harder here

#       if @db_user.guest?
#         # If user purchaised something but never registred
#         @db_user.update :name => params[:order][:user][:name]
#         if params[:order][:user][:password] # Yay, user finaly want's to register
#           @db_user.name.nil? ? (return false) : (@db_user.update password: params[:order][:user][:password])
#         end
#         login @db_user

#       else
#         # Registred user!!! He already has a password, so we need to verify it
#         if user[:password_digest] == @db_user[:password_digest] # check password
#           @db_user.update :name => params[:order][:user][:name] # Just in case, we will use new name
#           login user
#         else # login fail. User must login before using this email!
#           return nil
#         end
#       end

#     end
#   end

end
