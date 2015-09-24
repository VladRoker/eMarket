class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name,        :null => false, :unique => true
      t.decimal :price,       :null => false, :precision => 8, :scale => 2
      t.decimal :discount,                    :precision => 8, :scale => 2
      t.boolean :sale_flag,   :null => false, :default => false
      t.text    :description
      t.integer :category_id, :null => false
      t.integer :quantity,    :null => false, :default => 0

      t.timestamps null: false
    end
  end
end
