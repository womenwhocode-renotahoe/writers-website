class RegistrationsController < Devise::RegistrationsController
  protected

    def after_update_path_for(resource)
    	return writers_path if admin_user_signed_in?
    	writer = Writer.find_by_user_id(current_user.id)
      wall_writer_path(writer)
    end
end