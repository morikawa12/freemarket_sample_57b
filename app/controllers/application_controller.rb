class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, profile_attributes: [:family_name],profile_attributes: [:first_name],profile_attributes: [:family_name_kana],profile_attributes: [:first_name_kana],profile_attributes: [:birthday]])
  end

  private

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == 'admin' && password == '2222'
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end  
end
