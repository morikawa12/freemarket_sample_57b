class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validate :email_presence
  
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :address

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         
  validates :nickname, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,length: { minimum: 6 , maximum: 128 }

  def email_presence
    return if email.present?
    errors.add(:base, "このメールアドレスは既に使われております。")
  end

 # SNS認証 facebookとGoogleからuid,provider,email,などの値を受け取ってomniauth_callbacks_controller.rbにsessionとして送る。
 def self.find_oauth(auth)
  @user = User.where(uid: auth.uid, provider: auth.provider).first #userテーブルにprovider、uidがあったらログイン処理
            
    unless @user       
      @user = User.new(
                      uid: auth.uid,
                      provider: auth.provider,
                      nickname: auth.info.name,
                      email: auth.info.email,
                      password: Devise.friendly_token[0, 20],
                    )
    end
   return @user
  end
  
end
