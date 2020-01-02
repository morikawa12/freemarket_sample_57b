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
  # Userモデルをomniauthableにすると、config/routes.rbにdevise_for :usersを記述することで以下のURLメソッドがDeviseによって作成されます。
  # user_omniauth_authorize_path(provider)
  # user_omniauth_callback_path(provider)

  has_many :sns_credential
         
  validates :nickname, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,length: { minimum: 6 , maximum: 128 }

  def email_presence
    return if email.present?
    errors.add(:base, "このメールアドレスは既に使われております。")
  end

#   コールバックされた値のproviderおよびuidからDBを検索し、条件に合わせてコントローラに返す。
#   controllerのcallback_for(provider)内から呼び出される。
#   controllerのrequest.env("omniauth.auth")が引数で引き継がれる。env（）
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
