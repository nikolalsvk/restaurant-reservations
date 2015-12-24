class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    current_user.update_attribute :role, "guest"
    after_sign_in_path_for(resource)
  end
end
