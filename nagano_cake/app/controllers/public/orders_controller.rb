class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(payment_method: params[:order][:payment_method])

    @order.postage = 800
    #送料定義 全国一律固定

    if params[:select_address] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:select_address] == "2"
      @order.name = Address.find(params[:order][:address].to_i).name
      @order.postal_code = Address.find(params[:order][:address].to_i).postal_code
      @order.address = Address.find(params[:order][:address].to_i).address_name
    elsif params[:select_address] == "3"
      @order.name = params[:name]
      @order.postal_code = params[:postal_code]
      @order.address = params[:address_name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_thanks_path

    #order_itemにここで格納するべきだと思う
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderItem.create(
        item_id: cart_item.item.id,
        order_id: @order.id,
        amount: cart_item.amount,
        price_including_tax: add_tax_price(cart_item.item.price)
        )
    end

    @cart_items.destroy_all

  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :payment_method, :total_payment, :postage)
  end
end
