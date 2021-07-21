class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item.present?
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      redirect_to cart_items_path
    else
      render 'public/items/show'
    end
  end

  def update
    #動作チェックしてない（amount変更で使う）
    @cart_item = CartItem.find_by(params[:id])
    if @cart_item.save
      redirect_to cart_items_path
    else
      render 'public/cart_items'
    end
  end

  def destroy
    cart_items = CartItem.where(customer_id: current_customer.id)
    #別のアイテムが削除される（IDの指定がおかしい）
    @cart_item = cart_items.find_by(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path
    else
      render root_path
    end
  end

  def destroy_all
    if CartItem.where(customer_id: current_customer.id).destroy_all
      redirect_to cart_items_path
    else
      render root_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
