class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :cart, :to_cart, :current_user

  def cart
    session && session[:products] ? session[:products] : {}
  end

  def to_cart(prod, quan)
    if prod.instance_of?(Fixnum) && Product.exist?(prod)
      @prod = Product.find(prod)
      if @prod.available
        session[:products][prod.to_s] = quan
        # session key products store hash where key is product ID and value is quantity
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path unless current_user
  end
end
