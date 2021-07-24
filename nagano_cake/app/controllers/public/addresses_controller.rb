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
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      redirect_to root_path
    end
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
    params.require(:address).permit(:name, :postal_code, :address).merge(customer_id: current_customer.id)
  end
  #モデル名＝カラム名であるためか、createが発火しない→requireを抜いてみる→updateが機能しなくなる
end
