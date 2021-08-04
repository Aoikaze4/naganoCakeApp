class Admin::HomeController < Admin::AdminsController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10).reverse_order
    render 'admin/orders/index'
  end
end