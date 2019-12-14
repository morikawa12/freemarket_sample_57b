class Profile < ApplicationRecord

  belongs_to :user, optional: true

  VALID_PHONE_REGEX =                 /\A\d{10}$|^\d{11}\z/

  validates :family_name,               presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :birthday,            presence: true
  validates :mobile_phone,            presence: true, format: { with: VALID_PHONE_REGEX }
end
