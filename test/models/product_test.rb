require 'test_helper'

class CategoryTest < MiniTest::Spec
  it "Product can not be saved without name" do
    prod = build(:product, name: nil)
    lambda {prod.save!}.must_raise(ActiveRecord::RecordInvalid)
    prod = build(:product, name: 'Dog toy')
    expect(prod.save!).must_equal true
  end
  it "Product default quantity is 0" do
    prod = build :product
    prod.quantity.must_equal 0
  end
  it "Product must have price" do
    prod = build(:product, price: nil)
    lambda {prod.save!}.must_raise(ActiveRecord::RecordInvalid)
    prod = build(:product, price: '8.00')
    expect(prod.save!).must_equal true
  end
  it "Product must have category" do
    prod = build(:product, category_id: nil)
    lambda {prod.save!}.must_raise(ActiveRecord::RecordInvalid)
    prod = build(:product)
    expect(prod.save!).must_equal true
  end
end