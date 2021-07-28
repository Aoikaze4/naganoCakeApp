class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def my_page
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.new(customer_params)
    customer.save!
    redirect_to my_page_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :email)
  end
end
