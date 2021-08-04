class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    active_items = Item.where(is_active: true)
    @items = active_items.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end
end
