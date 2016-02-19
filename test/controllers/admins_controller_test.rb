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
  test "should not get categories if guest" do
    get :categories_index, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get category if guest" do
    category = create(:category)
    category.save!
    get :category, {:id => category.id}, {:user_id => nil}
    assert_response 401
  end
  test "should not get new category page if guest" do
    get :new_category, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get products if guest" do
    get :products, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not get product if guest" do
    product = create(:product)
    product.save!
    get :product, {:id => product.id}, {:user_id => nil}
    assert_response 401
  end
  test "should not get new product page if guest" do
    get :new_product, nil, {:user_id => nil}
    assert_response 401
  end
  test "should not delete anything if guest" do
    category = create(:category)
    category.save!
    get :delete, {:type => 'category', :id => category.id}, {:user_id => nil}
    assert_response 401
  end
  ###########
  # Users
  ###########
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
  test "should not get categories if user" do
    get :categories_index, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get category if user" do
    category = create(:category)
    category.save!
    get :category, {:id => category.id}, {:user_id => user.id}
    assert_response 401
  end
  test "should not get new category page if user" do
    get :new_category, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get products if user" do
    get :products, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not get product if user" do
    product = create(:product)
    product.save!
    get :product, {:id => product.id}, {:user_id => user.id}
    assert_response 401
  end
  test "should not get new product page if user" do
    get :new_product, nil, {:user_id => user.id}
    assert_response 401
  end
  test "should not delete anything if user" do
    category = create(:category)
    category.save!
    get :delete, {:type => 'category', :id => category.id}, {:user_id => user.id}
    assert_response 401
  end
  ###########
  # Administrator
  ###########
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
  test "should get categories if admin" do
    get :categories_index, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should get category if admin" do
    category = create(:category)
    category.save!
    get :category, {:id => category.id}, {:user_id => admin.id}
    assert_response :success
  end
  test "should get new category page if admin" do
    get :new_category, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should get products if admin" do
    get :products, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should get product if admin" do
    product = create(:product)
    product.save!
    get :product, {:id => product.id}, {:user_id => admin.id}
    assert_response :success
  end
  test "should get new product page if admin" do
    get :new_product, nil, {:user_id => admin.id}
    assert_response :success
  end
  test "should not delete anything if admin" do
    category = create(:category)
    category.save!
    delete :delete, {:type => 'category', :id => category.id}, {:user_id => admin.id}
    assert_response :found
  end
end
