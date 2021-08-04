class Public::ItemsController < ApplicationController
  before_action :active_item, only: [:show]

  def active_item
    @item = Item.find(params[:id])
    unless @item.is_active == true
      redirect_to items_path, alert: "指定の商品は現在販売停止中です。"
    end
  end

  def index
    active_items = Item.where(is_active: true)
    @items = active_items.page(params[:page]).reverse_order
    @items_count = active_items.count
  end

  def show
    @item = Item.find(params[:id])
  end
end
