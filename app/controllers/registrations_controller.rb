# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    if resource.active_for_authentication?
      set_flash_message! :notice, :signed_up
      sign_up(resource_name, resource)
    end
    render json: resource
  end

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name,
                                 :last_name, :image_url, :locale)
  end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    login_path
  end
  
end
