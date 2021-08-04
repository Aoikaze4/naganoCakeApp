class HomesController < ApplicationController
  def top
    active_items = Item.where(is_active: true)
    @items = active_items.last(4).reverse
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
