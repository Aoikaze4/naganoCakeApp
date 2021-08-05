class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def index
    @orders = Order.page(params[:page]).per(10).reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order_items = order.order_items
    if order.update(order_params)
      if order.order_status == "支払い済み"
        order_items.update_all(make_status: 1)
      end

      redirect_to admin_order_path(params[:id]), notice: '注文ステータスの変更が完了しました。'

    else
      render :show

    end
  end

  def customer_orders
    orders = Order.where(customer_id: params[:id])
    @orders = orders.page(params[:page]).per(10).reverse_order
    render "admin/orders/index"
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
