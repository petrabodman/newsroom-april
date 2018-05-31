class RegistrationsController < Devise::RegistrationController

  protected

  def after_sign_up_path_for(resource)
    '/subscriptions/new'
  end
end
