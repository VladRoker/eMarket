require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "save order" do
    assert build(:order).save
  end
  test "save order without price fails" do
    assert_raise ActiveRecord::RecordInvalid do
      build(:order, price: nil).save!
    end
  end
  test "save order without status fails" do
    assert_raise ActiveRecord::RecordInvalid do
      build(:order, status: nil).save!
    end
  end
end
