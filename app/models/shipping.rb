class Shipping < ApplicationRecord
  belongs_to :item
  has_ancestry
end
