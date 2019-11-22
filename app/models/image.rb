class Image < ApplicationRecord
  belongs_to :item

  mount_uploader :image, ImageUrlUploader

  validates :image, presence: true

end
