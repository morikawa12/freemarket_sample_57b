class SignupController < ApplicationController
  before_action :save_to_session, only: :step2

  def top
  end

  def step1 #ユーザー・本名、誕生日（Proifile）入力画面
    @user = User.new
    @user.build_profile
  end

  def save_to_session #email重複時のバリテーションエラー用
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:uid] = user_params[:uid]
    session[:provider] =  user_params[:provider]
    session[:profile_attributes_after_step1] = user_params[:profile_attributes]

    @user = User.new(
      nickname: user_params[:nickname],
      email: user_params[:email],
      password: user_params[:password],
      uid: user_params[:uid],
      provider: user_params[:provider],
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
  end

  def done #登録完了画面
    sign_in User.find(session[:id]) unless user_signed_in? #登録後ユーザーIDをsessionで持たせてログイン状態にさせる
  end

  def create
    
    @user = User.new(
      email: session[:email],
      password: session[:password],
      nickname: session[:nickname],
      uid: session[:uid],
      provider: session[:provider]
    )
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    customer = Payjp::Customer.create(
      card: params['payjp-token']
    )
    @user.build_address(session[:address_attributes_after_step3]) 
    @user.build_profile(session[:profile_attributes_after_step2])

    if@user.save
      session[:id] = @user.id
      @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
      @card.user_id = session[:id]
      @card.save
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
      :uid,
      :provider,
      profile_attributes: [:family_name, :first_name, :family_name_kana , :first_name_kana, :birthday, :mobile_phone],
      address_attributes: [:zip_code, :prefecture, :city, :block, :building, :home_phone]
    )
  end

end
