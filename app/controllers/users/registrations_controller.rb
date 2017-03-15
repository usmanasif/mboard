class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:create]

  def edit
    raise ActionController::RoutingError.new 'Not implemented!'
  end

  def update
    raise ActionController::RoutingError.new 'Not implemented!'
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name) }
  end
end
