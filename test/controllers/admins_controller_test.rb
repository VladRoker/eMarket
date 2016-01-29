require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  user = create(:registred_user)
  user.save!
  admin = create(:admin)
  admin.save!
  # Guests
  test "should not get update if guest" do
    patch :update, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get index if guest" do
    get :index, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get users if guest" do
    get :users, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get user if guest" do
    get :user, {:id => user.id}, {:user_id => nil}
    assert_response 401
  end
  # Users
  test "should not get update if user" do
    patch :update, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get index if user" do
    get :index, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get users if user" do
    get :users, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get user if user" do
    get :user, {:id => user.id}, {:user_id => user.id}
    assert_response 401
  end
  # Administrator
  test "should get update if admin" do
    patch :update, {user:{:id => user.id}}, {:user_id => admin.id}
    assert_response :found
  end
  test "should get index if admin" do
    get :index, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should get users if admin" do
    get :users, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should get user if admin" do
    get :user, {:id => user.id}, {:user_id => admin.id}
    assert_response :success
  end
end
