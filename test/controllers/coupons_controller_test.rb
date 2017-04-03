require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  user = create(:registred_user)
  coupon = create(:registred_coupon)
  test "index is available to users" do
    get :index, params: nil, session: {:user_id => user.id}
    assert_response :success
  end
  test "index is not available to guests" do
    get :index, params: nil, session: {:user_id => nil}
    assert_redirected_to login_path
  end
  test "show is available to users" do
    get :index, params: {:id => coupon.id}, session: {:user_id => user.id}
    assert_response :success
  end
  test "show is not available to guests" do
    get :index, params: {:id => coupon.id}, session: {:user_id => nil}
    assert_redirected_to login_path
  end
  test "new is available to users" do
    get :index, params: nil, session: {:user_id => user.id}
    assert_response :success
  end
  test "new is not available to guests" do
    get :index, params: nil, session: {:user_id => nil}
    assert_redirected_to login_path
  end
  test "create is available to users" do
    get :index, params: {:coupon => build(:coupon)}, session: {:user_id => user.id}
    assert_response :success
  end
  test "create is not available to guests" do
    get :index, params: {:coupon => build(:coupon)}, session: {:user_id => nil}
    assert_redirected_to login_path
  end
  test "delete is available to users" do
    get :index, params: {:coupon => create(:coupon)}, session: {:user_id => user.id}
    assert_response :success
  end
  test "delete is not available to guests" do
    get :index, params: {:coupon => create(:coupon)}, session: {:user_id => nil}
    assert_redirected_to login_path
  end
end
