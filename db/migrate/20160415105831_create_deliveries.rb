class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :deliverable, polymorphic: true, index: true
      t.string :country, :null => false
      t.string :city, :null => false
      t.string :address, :null => false
      t.string :zip, :null => false
      t.text :info

      t.timestamps null: false
    end
  end
end
