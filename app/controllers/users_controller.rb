class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if params[:user][:password].nil? || params[:user][:password].empty?
      # puts 'Yay!!!!!'
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

  def contacts
    @contacts = Contact.find_by_language I18n.locale
    if @contacts.nil?
      @contacts = Contact.find_by_language I18n.default_locale
    end
    if @contacts.nil?
      @contacts = Contact.first
    end
    if @contacts.nil?
      @contacts = Contact.new
    end
  end
end
