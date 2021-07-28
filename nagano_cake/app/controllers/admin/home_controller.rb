class Admin::HomeController < Admin::AdminsController
  before_action :authenticate_admin!

  def index
  end
end