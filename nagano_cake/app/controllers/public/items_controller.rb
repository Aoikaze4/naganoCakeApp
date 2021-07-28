class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @items = Item.page(params[:page]).reverse_order
    @items_count = Item.count
    ##@acitve_items = Item.where(is_active: "True") ←アクティブのもののみ使用する場合
  end

  def show
    @item = Item.find(params[:id])
  end
end
