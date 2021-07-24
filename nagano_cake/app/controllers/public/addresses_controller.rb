class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end


  private
  def address_params
    params.permit(:name, :postal_code, :address, :customer_id)
  end
  #モデル名＝カラム名であるためrequireを抜いてみる
end
