class Image < ApplicationRecord
  belongs_to :item, optional: true

  mount_uploader :image_url, ImageUrlUploader

  validates :image_url, presence: true
  # validates :item_id, presence: true

end
