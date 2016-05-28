class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, except: [:show]
  before_filter :authorize_admin, only: [:index]
  before_filter :current_user_or_admin?, only: [:edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if admin_user_signed_in? then
      writers_path
    else
      dashboard_path(resource)
    end
  end

  def admin_user_signed_in?
    if user_signed_in? && current_user.admin?
      true
    else
      false
    end
  end

  def current_user_or_admin?
    redirect_to writer_path(current_user.writer) unless current_user == Writer.find(params[:id]).user || admin_user_signed_in?
  end

  def authorize_admin
    redirect_to new_user_registration_path, :status => 401 unless admin_user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end
end

