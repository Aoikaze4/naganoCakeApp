class HomesController < ApplicationController
  def top
    num = 0
    @items = Item.last(4).reverse
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
