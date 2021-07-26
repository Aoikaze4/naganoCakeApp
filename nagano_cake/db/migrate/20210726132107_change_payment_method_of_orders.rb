class ChangePaymentMethodOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :payment_method, from:"", to: 0
  end
end
