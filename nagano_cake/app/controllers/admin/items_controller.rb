class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    ##@item.save!
    ##ジャンル登録しないとダメと言われるのでジャンル登録が先
    redirect_to root_path
  end

  def index
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active,:image)
  end
end
