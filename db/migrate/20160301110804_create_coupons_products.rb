class CreateCouponsProducts < ActiveRecord::Migration
  def change
    create_table :coupons_products, id: false do |t|
      t.belongs_to :coupon, index: true
      t.belongs_to :product, index: true
    end
  end
end
