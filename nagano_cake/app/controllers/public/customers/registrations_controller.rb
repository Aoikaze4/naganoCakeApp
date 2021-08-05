class Public::Customers::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    my_page_path
  end

end