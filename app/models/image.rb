class Image < ApplicationRecord
  belongs_to :item
  # validates :item, presence: true
  mount_uploader :image_url, ImageUrlUploader
end
