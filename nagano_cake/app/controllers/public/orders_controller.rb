class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    if params[:select_address] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:select_address] == "2"
      @order.name = Address.find(params[:order][:address].to_i).name
      @order.postal_code = Address.find(params[:order][:address].to_i).postal_code
      @order.address = Address.find(params[:order][:address].to_i).address_name
    elsif params[:select_address] == "3"
      #validationを実装したい（3が選ばれた時のみにしないと空白のときに面倒になるので、コントローラーで処理？）
      @order.name = params[:name]
      @order.postal_code = params[:postal_code]
      @order.address = params[:address_name]
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :payment_method)
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address_name).merge(customer_id: current_customer.id)
  end
end
