# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    provider = provider.to_s
            # userモデルに定義したfind_oauthメソッド
    @user = User.find_oauth(request.env["omniauth.auth"])

    #-----------
      session[:uid] = @user.uid
      session[:provider] = @user.provider
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:user_image] = request.env["omniauth.auth"].info.image
      session[:password] = @user.password
    #-----------
    
    if @user.persisted?       #userが存在したら。
      sign_in_and_redirect @user, event: :authentication  #after_sign_in_path_forと同じ。（ログイン時実行されるメソッド、ログイン時に飛んでほしいページを指定）
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else    #userが存在しない場合
      redirect_to controller:"/signup", action:"api"      #会員情報入力ページに飛ばす
    end
  end
  
  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to api_signup_index_path
    end
  end

  def failure
    redirect_to root_path
  end  
end
