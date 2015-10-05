require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "create session" do
    get :new
    assert_response :success
  end
  test "create user session" do
    @user = create(:registred_user)
    post :create, user: {email: @user.email, password: @user.password}
    assert_redirected_to root_path
  end
  test "create user incorrect session fail" do
    @user = create(:registred_user)
    post :create, user: {email: @user.email, password: "__#{@user.password}__"}
    assert_redirected_to login_path
  end
  test "destroy user session" do
    @user = create(:registred_user)
    post :destroy
    assert_redirected_to root_path
    assert session[:user_id].nil?
  end
end
