class AdminsController < ApplicationController
  before_action :test_access
  def index

  end

  private
  def test_access
    unless @current_user && @current_user.admin?
      render :file => "public/401.html", :status => :unauthorized
    end
  end
end
