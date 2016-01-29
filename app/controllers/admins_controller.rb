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
      render :json => params[:product]
    elsif params[:category]
      render :json => params[:category]
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
