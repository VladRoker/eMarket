class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.text    :code
      t.integer :percent
      t.decimal :amount, precision: 8, scale: 2
      t.integer :user_id
      t.boolean :used_flag

      t.timestamps null: false
    end
  end
end