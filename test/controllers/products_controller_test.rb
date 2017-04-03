require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "get product" do
    product = create(:product)
    get :show, params: { :id =>  product.id }
    assert_response :success
  end
end
