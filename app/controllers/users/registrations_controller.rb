module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end
  end
end