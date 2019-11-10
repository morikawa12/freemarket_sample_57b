class Item < ApplicationRecord
  belongs_to :size
  belongs_to :brand
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
  has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy
  has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :deals
  has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :deals
end
