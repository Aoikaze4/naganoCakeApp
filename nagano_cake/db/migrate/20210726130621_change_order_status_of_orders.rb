class ChangeOrderStatusOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :order_status, from:"", to: 0
  end
end
