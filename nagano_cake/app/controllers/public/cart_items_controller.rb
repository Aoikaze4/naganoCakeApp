class Public::CartItemsController < ApplicationController
  def index
    cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)

  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_items).permit(:amount)
  end
end
