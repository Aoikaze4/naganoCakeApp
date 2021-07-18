class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   items_path
  # end
  # ↑ログイン後遷移先をいじりたい場合。管理者トップページとして後程必要

  def add_tax_price
    tax = 1.10
    (@item.price * tax).round
  end
  helper_method :add_tax_price

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name,:first_name,:last_name_kana,:first_name_kana,
                                                        :postal_code,:address,:telephone_number,:is_active])
    end
end
