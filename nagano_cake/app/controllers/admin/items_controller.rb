class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to item_path(@item.id)
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active, :image)
  end
end
