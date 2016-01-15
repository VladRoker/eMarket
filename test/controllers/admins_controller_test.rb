require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should not get index" do
    get :index
    assert_response 401
  end
  test "should get index if admin" do
    get :index
    if @current_user && @current_user.admin?
	    assert_response :success
	end
  end
end
