class SignupController < ApplicationController

  def step1
    @user = User.new

  end

  def step2
    session[:user_params] = user_params  #userモデルの値をぶっこむ。
    session[:profile_attributes_after_step1] = user_params[:profile_attributes]  # profileモデルの値をぶっこむ。
    @user = User.new

  end

  def step3
    session[:profile_attributes_after_step2] = user_params[:profile_attributes]  # step2で入力された情報をsessionにぶっこむ。
    session[:profile_attributes_after_step2].merge!(session[:profile_attributes_after_step1])  # step2のsessionにstep1のsessionの中身を合わせる。
    @user = User.new

  end

  def step4
    @user = User.new
  end

  def create
    @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_profile(session[:profile_attributes_after_step1])  # ここでprofileモデルのsessionを引数で渡す。
    @user.build_profile(session[:profile_attributes_after_step2])
    @user.build_addresse(session[:addresse_attributes_after_step3])
    @user.build_profile(user_params[:profile_attributes])  # 今回のビューで入力された情報を代入。
    if @user.save
      session[:id] = @user.id  
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :nickname,
      profile_attributes: [:family_name, :first_name, :family_name_kana , :first_name_kana, :birthday, :mobile_phone, :card_number, :expiration_date, :security_code],
      addresse_attributes: [:zip_code, :prefecture, :city, :block, :building, :home_phone]
    )
  end

end
