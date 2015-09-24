class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,     null: false, unique: true
      t.string :ancestry
      t.text :description

      t.timestamps null: false
    end
    add_index :categories, :ancestry
  end
end
