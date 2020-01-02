class SignupController < ApplicationController
  before_action :save_to_session, only: :step2

  def top
  end

  def step1 #ユーザー・本名、誕生日（Proifile）入力画面
    @user = User.new
    @user.build_profile
  end

  def api #メールアドレス,facebook,google
    @user = User.new
    @user.build_profile
  end

  def save_to_session #email重複時のバリテーションエラー用
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:profile_attributes_after_step1] = user_params[:profile_attributes]
    @user = User.new(
      nickname: user_params[:nickname],
      email: user_params[:email],
      password: user_params[:password],
    )
    render '/signup/step1' unless @user.valid?
  end

  def step2 #携帯番号入力画面
    @user = User.new
    @user.build_profile
  end

  def step3 #住所入力画面
    session[:profile_attributes_after_step2] = user_params[:profile_attributes]
    session[:profile_attributes_after_step2].merge!(session[:profile_attributes_after_step1]) 
    @user = User.new
    @user.build_address
  end

  def step4 #クレジットカード登録画面
    session[:address_attributes_after_step3] = user_params[:address_attributes]
    @user = User.new
    @user.build_profile
    @user.build_address
  end

  def done #登録完了画面
    sign_in User.find(session[:id]) unless user_signed_in? #登録後ユーザーIDをsessionで持たせてログイン状態にさせる
  end

  def create
    session[:profile_attributes_after_step4] = user_params[:profile_attributes]
    session[:profile_attributes_after_step4].merge!(session[:profile_attributes_after_step2])
    
    @user = User.new(
      email: session[:email],
      password: session[:password],
      nickname: session[:nickname],
    )
    @user.build_address(session[:address_attributes_after_step3]) 
    @user.build_profile(session[:profile_attributes_after_step4])

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1' #登録に不備があれば最初から入力し直す
    end
  end

private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :nickname,
      profile_attributes: [:family_name, :first_name, :family_name_kana , :first_name_kana, :birthday, :mobile_phone,:card_number, :expiration_date, :security_code],
      address_attributes: [:zip_code, :prefecture, :city, :block, :building, :home_phone]
    )
  end

end
