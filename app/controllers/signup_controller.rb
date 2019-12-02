class SignupController < ApplicationController

  def index
  end

  def step1
    @user = User.new
    @user.build_profile
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:profile_attributes_after_step1] = user_params[:profile_attributes]
    @user = User.new
    @user.build_profile
  end

  def step3
    session[:profile_attributes_after_step2] = user_params[:profile_attributes]
    session[:profile_attributes_after_step2].merge!(session[:profile_attributes_after_step1]) 
    @user = User.new
    @user.build_address
  end

  def step4
    session[:address_attributes_after_step3] = user_params[:address_attributes]
    @user = User.new
    @user.build_profile
    @user.build_address
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    session[:profile_attributes_after_step4] = user_params[:profile_attributes]
    session[:profile_attributes_after_step4].merge!(session[:profile_attributes_after_step2]) 
    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      nickname: session[:nickname]
    )
    @user.build_address(session[:address_attributes_after_step3]) 
    @user.build_profile(session[:profile_attributes_after_step4])

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step4'
    end
  end

private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :nickname,
      profile_attributes: [:family_name, :first_name, :family_name_kana , :first_name_kana, :birthday, :mobile_phone,:card_number, :expiration_date, :security_code],
      address_attributes: [:zip_code, :prefecture, :city, :block, :building, :home_phone]
    )
  end


end
