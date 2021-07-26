class ChangeMakeStatusDefalutToOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :order_items, :make_status, from: "", to: 0
  end
end
