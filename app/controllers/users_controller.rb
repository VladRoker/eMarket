class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if params[:user][:password].nil?
      redirect_to sign_up_path
    else
      if user.save
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to sign_up_path
      end
    end
  end
end
