class Public::OrdersController < ApplicationController
  def new
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :payment_method)
  end
end
