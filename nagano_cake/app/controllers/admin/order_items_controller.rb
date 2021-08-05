class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    order = order_item.order
    if order_item.update(order_item_params)
      if order_item.make_status == "製作中"
        order.update(order_status: 2)
      elsif order.order_items.count == order.order_items.where(make_status: "製作完了").count
        #すべてのアイテムが製作完了になったら
        order.update(order_status: 3)
      end

      redirect_to admin_order_path(order_item.order.id), notice: "製作ステータスの変更が完了しました。"
    else
      render 'admin/orders/show'
    end
  end


  private
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
