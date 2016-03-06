require 'test_helper'

class CouponTest < MiniTest::Spec
  it "Coupon can not be saved without code" do
    coupon = build(:coupon, code: nil)
    lambda {coupon.save!}.must_raise(ActiveRecord::RecordInvalid)
    coupon = build(:coupon, code: '123-45678-90')
    expect(coupon.save!).must_equal true
  end
  it "Coupon can not be saved without amount or percent" do
    coupon = build(:coupon, amount: nil, percent: nil)
    lambda {coupon.save!}.must_raise(ActiveRecord::RecordInvalid)
    coupon = build(:coupon, amount: 20.99, percent: nil)
    expect(coupon.save!).must_equal true
    coupon = build(:coupon, amount: nil, percent: 25)
    expect(coupon.save!).must_equal true
    coupon = build(:coupon, amount: 12.99, percent: 75)
    expect(coupon.save!).must_equal true
  end
  it "Coupon is invisible to users if it is used" do
    coupon = create(:coupon, used_flag: false)
    expect(Coupon.find(coupon.id)).must_equal coupon
    coupon.used_flag = true
    coupon.save!
    lambda {Coupon.find(coupon.id)}.must_raise(ActiveRecord::RecordNotFound)
  end
end
