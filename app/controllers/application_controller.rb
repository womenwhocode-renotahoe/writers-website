class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, except: [:show]
  before_filter :authorize_admin, only: [:index]

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

  def authorize_admin
    redirect_to new_user_registration_path, :status => 401 unless admin_user_signed_in?
  end
end

