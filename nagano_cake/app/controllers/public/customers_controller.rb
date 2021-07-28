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
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to my_page_path, notice: '編集が完了しました。'
    else
      render :edit
    end
  end

  def leave
  end

  def update_leave
    customer = Customer.find(current_customer.id)
    if customer.update_attribute(:is_active, false)
      @items = Item.all
      reset_session
      redirect_to root_path, notice: '退会が完了しました。ご利用いただきありがとうございました。'
    else
      render :leave
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
