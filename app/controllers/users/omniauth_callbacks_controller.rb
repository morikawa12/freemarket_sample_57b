# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  
  # def google_oauth2
  #   callback_for(:google)
  # end
  
  def callback_for(provider)
    # FacebookからOmniAuthで取得したすべての情報はrequest.env["omniauth.auth"]のハッシュでアクセスできます
    @user = User.find_oauth(request.env["omniauth.auth"])
    # @userが保存済みか確認
    if @user.persisted?
      # sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      sign_in @user
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      # OmniAuthで所得したデータをprovider_dataに格納し、セッションで引き回せるようにしてリダイレクト
      # devise.をつけておくとdeviseでログインした後に捨てるから安全らしい
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to signup_registration_path
    end
  end

  def failure
    redirect_to root_path
  end  
end
  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to new_user_registration_url
  #   end
  # end