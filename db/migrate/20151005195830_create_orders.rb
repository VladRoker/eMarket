class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id,     :index => true
      t.decimal :price,       :null => false, :precision => 8, :scale => 2
      t.string :status,       :null => false

      t.timestamps            :null => false
    end

    create_table :orders_products, id: false do |t|
      t.integer :order_id,     :index => true
      t.integer :product_id,   :index => true
    end
  end
end
