class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      t.integer :product_id
      t.string  :image

      t.timestamps null: false
    end
    add_column :products, :image, :string
  end
end
