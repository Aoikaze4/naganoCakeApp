class Public::CartItemsController < ApplicationController
  def index
    cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def destroy
  end

  private
  def cart_item_params
    params.require(:cart_items).permit(:amount)
  end
end
