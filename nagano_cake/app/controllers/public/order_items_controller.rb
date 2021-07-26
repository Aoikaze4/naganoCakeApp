class Public::OrderItemsController < ApplicationController
  def index
    Order_items = CartItem.where(customer_id: current_customer.id)
  end
end
