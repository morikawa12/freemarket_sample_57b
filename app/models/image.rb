class Image < ApplicationRecord
  belongs_to :item, dependent: :destroy_all

  mount_uploader :image_url, ImageUrlUploader
end
