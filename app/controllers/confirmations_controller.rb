class ConfirmationsController << Devise::ConfirmationsController
	def after_confirmation_path_for(resource)
	end
end
