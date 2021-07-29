class Admin::AdminsController < ApplicationController
  #skip_before_action :authenticate_user!
  before_action :authenticate_admin!

  #layout 'admins'
  def index
  end
end
