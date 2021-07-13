class Public::CartItemsController < ApplicationController
  def index
    cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = CartItem.new(params[:id])
    @cart_item.save
    redirect_to '/cart_items'
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
