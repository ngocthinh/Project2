class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permission

  layout "admin"

  def check_admin_permission
    unless current_user.has_role? :admin
      flash[:danger] = t "admin_base_denied"
      redirect_to root_url
    end
  end

  def index
  end
end
