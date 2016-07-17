class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    return writers_path if admin_user_signed_in?
    writer = Writer.find_by_user_id(current_user.id)
    if writer.full_name.blank? then
      edit_writer_path(writer)
    else
      wall_writer_path(writer)
    end
  end

  def admin_user_signed_in?
    user_signed_in? && current_user.role == "admin"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :avatar, :time_zone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :avatar, :time_zone])

  end
end

