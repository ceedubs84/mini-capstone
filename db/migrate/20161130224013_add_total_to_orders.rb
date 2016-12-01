class AddTotalToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :decimal, precision: 9, scale: 2
  end
end
