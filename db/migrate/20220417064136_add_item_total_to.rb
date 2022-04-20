class AddItemTotalTo < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :item_total, :float
  end
end
