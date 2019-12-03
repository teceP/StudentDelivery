class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #devise sign up and update profile permissions
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation, :preferred)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :surname, :email, :avatar, :subject, :password, :password_confirmation, :preferred, :current_password, :points, :bio)
    end
  end

end
