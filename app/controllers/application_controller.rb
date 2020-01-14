# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # devise sign up and update profile permissions
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation, :preferred)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:username, :email, :avatar, :subject, :password, :password_confirmation, :preferred, :current_password, :karma, :bio)
      end
    end

    def require_user
      return if user_signed_in?
      flash[:notice] = "Please log in"

      redirect_to new_user_session_path
    end

    def require_admin
      return if current_user.admin?
      flash[:notice] = "Missing Privileges"
      redirect_to root_path
    end
end
