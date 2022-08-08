class ApplicationController < ActionController::Base
  # THIS is being handled by the generate devise:controller users
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
