class Admin::SessionsController < Devise::SessionsController
  #askip_before_action :authenticate_user!
  #layout 'admins'
  #admin用にlayoutを切る →必要ない？

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  def after_sign_in_path_for(resource)
    admin_root_path
  end
end