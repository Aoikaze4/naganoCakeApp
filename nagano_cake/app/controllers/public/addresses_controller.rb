class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save!
    redirect_to addresses_path
  end

  def edit
  end

  def destroy
    addresses = Address.where(customer_id: current_customer.id)
    address = addresses.find_by(id: params[:id])
    if address.destroy
      redirect_to addresses_path
    else
      render root_path
    end
  end

  private
  def address_params
    params.permit(:name, :postal_code, :address).merge(customer_id: current_customer.id)
  end
  #モデル名＝カラム名であるためrequireを抜いてみる
end
