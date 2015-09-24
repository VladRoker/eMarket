require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "get category" do
    category = create(:category)
    get :show, :id => category.id
    assert_response :success
  end
  test "get category index" do
    get :index
    assert_response :success
  end
end
