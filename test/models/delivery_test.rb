require 'test_helper'

class DeliveryTest < MiniTest::Spec
  it "Delivery can not be saved without deliverable" do
    delivery = build(:delivery)
    lambda {delivery.save!}.must_raise(ActiveRecord::RecordInvalid)
    delivery = build(:user_delivery)
    expect(delivery.save!).must_equal true
    delivery = build(:order_delivery)
    expect(delivery.save!).must_equal true
  end
  it "Delivery can not be saved without country" do
    delivery = build(:user_delivery, country: nil)
    lambda {delivery.save!}.must_raise(ActiveRecord::RecordInvalid)
    delivery = build(:user_delivery, country: 'qwerty')
    expect(delivery.save!).must_equal true
  end
  it "Delivery can not be saved without city" do
    delivery = build(:user_delivery, city: nil)
    lambda {delivery.save!}.must_raise(ActiveRecord::RecordInvalid)
    delivery = build(:user_delivery, city: 'qwerty')
    expect(delivery.save!).must_equal true
  end
  it "Delivery can not be saved without address" do
    delivery = build(:user_delivery, address: nil)
    lambda {delivery.save!}.must_raise(ActiveRecord::RecordInvalid)
    delivery = build(:user_delivery, address: 'qwerty')
    expect(delivery.save!).must_equal true
  end
  it "Delivery can not be saved without zip" do
    delivery = build(:user_delivery, zip: nil)
    lambda {delivery.save!}.must_raise(ActiveRecord::RecordInvalid)
    delivery = build(:user_delivery, zip: 'qwerty')
    expect(delivery.save!).must_equal true
  end
end
