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
    if order.update(order_params)
      redirect_to admin_order_path(params[:id]), notice: '注文ステータスの変更が完了しました。'
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
