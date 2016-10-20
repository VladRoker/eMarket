class AddSlugToProductsAndCategories < ActiveRecord::Migration
  def up
    add_column :products,   :slug_en, :string, :unique => true
    Product.all.each {|product| product.slug_en = product.name.parameterize; product.save! }
    add_column :categories, :slug_en, :string, :unique => true
    Category.all.each {|category| category.slug_en = category.name.parameterize; category.save! }
    change_column_null :products,   :slug_en, false
    change_column_null :categories, :slug_en, false
  end
  def down
    remove_column :products,   :slug_en
    remove_column :categories, :slug_en
  end
end
