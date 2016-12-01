class ChangeOrderSubtotalAndTax < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :subtotal, "numeric USING CAST(subtotal AS numeric)"
    change_column :orders, :subtotal, :decimal, precision: 9, scale: 2
    change_column :orders, :tax, "numeric USING CAST(tax AS numeric)"
    change_column :orders, :tax, :decimal, precision: 9, scale: 2
  end
end
