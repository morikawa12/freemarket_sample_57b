class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    provider = provider.to_s
    @user = User.find_oauth(request.env["omniauth.auth"])

    session[:uid] = @user.uid
    session[:provider] = @user.provider
    session[:nickname] = @user.nickname
    session[:email] = @user.email
    session[:password] = @user.password

    if @user.persisted?       #userが存在したら。
      sign_in_and_redirect @user, event: :authentication  #after_sign_in_path_forと同じ。（ログイン時実行されるメソッド、ログイン時に飛んでほしいページを指定）
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else    #userが存在しない場合
      redirect_to sns_signup_index_path
    end
  end

end
