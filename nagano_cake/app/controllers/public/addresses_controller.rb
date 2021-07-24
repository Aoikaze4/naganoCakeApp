class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def new
    @address = Address.new(params[:id])
  end


  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
