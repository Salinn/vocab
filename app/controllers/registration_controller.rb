class RegistrationController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, only: [:new]

  def new
    super
  end
end
