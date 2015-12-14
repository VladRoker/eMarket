require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "get order" do
    get :new
    assert_response :success
  end
  test "save empty order fails" do
    post :create
    assert_redirected_to new_order_path
  end
  test 'save without user fails' do
  	@order = build(:order, user: nil)
  	post :create, order: @order
  	assert_redirected_to new_order_path
  	assert @order.id.nil?, 'Order did not been saved to DataBase'
  end
  test 'save with new guest user' do
  	@order = build(:order)
  	post :create, order: @order
  	assert_redirected_to root_path
  	assert @order.id, 'Order did not been saved to DataBase'
  	assert_equal @order.user_id, session[:user_id]
  end
  test 'save with (existing) guest user' do
  	@user = create(:user)
  	@order = build(:order, user: @user)
  	post :create, order: @order
  	assert_redirected_to root_path
  	assert @order.id, 'Order did not been saved to DataBase'
  	assert_equal @order.user_id, session[:user_id]
  end
  test 'save with registred user fails when password is wrong' do
  	post :create, order: build(:order, user: nil)
  	assert_redirected_to root_path
  	assert @order.id, 'Order did not been saved to DataBase'
  end
  test 'save with registred user when password is correct' do
  	post :create, order: build(:order)
  	assert_redirected_to login_path
  	assert @order.id, 'Order did not been saved to DataBase'
  end
end
