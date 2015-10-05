require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "get new user" do
    get :new
    assert_response :success
  end
  test "create user" do
    @user = build(:registred_user)
    post :create, user: {name: @user.name, email: @user.email, password: @user.password, password_confirmation: @user.password }
    assert_redirected_to root_path
    assert !session[:user_id].nil?
  end
  test "create user without password fail" do
    @user = build(:registred_user)
    post :create, user: {name: @user.name, email: @user.email, password: @user.password, password_confirmation: "__#{@user.password}__" }
    assert_redirected_to sign_up_path
  end
end
