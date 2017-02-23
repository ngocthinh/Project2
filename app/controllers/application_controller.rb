class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      admin_root_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
  
  protected
  def layout_by_resource
    if devise_controller?
      false
    else
      "application"
    end
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
