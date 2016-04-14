class AddCounterCacheToProducts < ActiveRecord::Migration
  def change
    add_column :products, :counter_cache, :integer
  end
end
