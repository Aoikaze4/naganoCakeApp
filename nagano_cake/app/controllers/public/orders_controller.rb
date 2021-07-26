class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
    @customer_address = "〒" + @customer.postal_code + @customer.address
    @customer_fullname = @customer.last_name + @customer.first_name
    
    @order = Order.new
    @address = Address.new
    
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Address.new(order_params)
    render 'public/orders/confirm'
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :payment_method)
  end
end
