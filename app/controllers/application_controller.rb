class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :cart, :to_cart, :current_user, :user_params

  def cart
    session && session[:products] ? session[:products] : {}
  end

  def to_cart(prod, quan=1)
    session[:products] ||= {}
    if Product.exists?(prod.to_i)
      @prod = Product.find(prod.to_i)
      if @prod.available?
        session[:products][prod.to_s] = quan.to_i
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

  def user_params(pre = nil)
    if pre.nil?
      params.require(:user).permit(:name, :email, :password)
    else
      params.require(pre.to_sym).require(:user).permit(:name, :email, :password)
    end
  end
end
