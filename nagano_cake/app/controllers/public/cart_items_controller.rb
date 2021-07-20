class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
      current_customer.cart_items.find_by(item_id: params[:item_id]).amount += params[:amount].to_i
      current_customer.cart_items.find_by(item_id: params[:item_id]).save
      redirect_to cart_items_path
    elsif @cart_item.save
      redirect_to cart_items_path
    else
      render 'public/items/show'
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
