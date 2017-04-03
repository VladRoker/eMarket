require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  user = create(:registred_user)
  user.save!
  admin = create(:admin)
  admin.save!
  ###########
  # Guests
  ###########
  test "should not get update if guest" do
    patch :update, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get index if guest" do
    get :index, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get users if guest" do
    get :users, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get user if guest" do
    get :user, params: {:id => user.id}, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get categories if guest" do
    get :categories_index, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get category if guest" do
    category = create(:category)
    category.save!
    get :category, params: {:id => category.id}, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get new category page if guest" do
    get :new_category, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get products if guest" do
    get :products, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get product if guest" do
    product = create(:product)
    product.save!
    get :product, params: {:id => product.id}, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get new product page if guest" do
    get :new_product, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get orders if guest" do
    get :orders, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get order page if guest" do
    order = create(:order)
    order.save!
    get :order, params: {:id => order.id}, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get new contacts page if guest" do
    get :new_contact, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not get contacts if guest" do
    get :contacts, params: nil, session: {:user_id => nil}
    assert_response 401
  end
  test "should not delete anything if guest" do
    category = create(:category)
    category.save!
    get :delete, params: {:type => 'category', :id => category.id}, session: {:user_id => nil}
    assert_response 401
  end
  ###########
  # Users
  ###########
  test "should not get update if user" do
    patch :update, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get index if user" do
    get :index, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get users if user" do
    get :users, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get user if user" do
    get :user, params: {:id => user.id}, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get categories if user" do
    get :categories_index, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get category if user" do
    category = create(:category)
    category.save!
    get :category, params: {:id => category.id}, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get new category page if user" do
    get :new_category, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get products if user" do
    get :products, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get product if user" do
    product = create(:product)
    product.save!
    get :product, params: {:id => product.id}, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get new product page if user" do
    get :new_product, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get orders if user" do
    get :orders, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get order page if user" do
    order = create(:order)
    order.save!
    get :order, params: {:id => order.id}, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get new contacts page if user" do
    get :new_contact, params: nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not get contacts if user" do
    get :contacts,params:  nil, session: {:user_id => user.id}
    assert_response 401
  end
  test "should not delete anything if user" do
    category = create(:category)
    category.save!
    get :delete, params: {:type => 'category', :id => category.id}, session: {:user_id => user.id}
    assert_response 401
  end
  ###########
  # Administrator
  ###########
  test "should get update if admin" do
    patch :update, params: {user:{:id => user.id}}, session: {:user_id => admin.id}
    assert_response :found
  end
  test "should get index if admin" do
    get :index, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get users if admin" do
    get :users, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get user if admin" do
    get :user, params: {:id => user.id}, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get categories if admin" do
    get :categories_index, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get category if admin" do
    category = create(:category)
    category.save!
    get :category, params: {:id => category.id}, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get new category page if admin" do
    get :new_category, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get products if admin" do
    get :products, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get product if admin" do
    product = create(:product)
    product.save!
    get :product, params: {:id => product.id}, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get new product page if admin" do
    get :new_product, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get orders if admin" do
    get :orders, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get order page if admin" do
    order = create(:order)
    order.save!
    get :order, params: {:id => order.id}, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get new contacts page if admin" do
    get :new_contact, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should get contacts if admin" do
    get :contacts, params: nil, session: {:user_id => admin.id}
    assert_response :success
  end
  test "should not delete anything if admin" do
    category = create(:category)
    category.save!
    delete :delete, params: {:type => 'category', :id => category.id}, session: {:user_id => admin.id}
    assert_response :found
  end
end
