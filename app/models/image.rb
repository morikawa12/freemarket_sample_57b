class Image < ApplicationRecord
  belongs_to :item, optional: true

  mount_uploader :image, ImageUrlUploader

  validates :image, presence: true

end
