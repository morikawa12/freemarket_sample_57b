class Shipping < ApplicationRecord
  has_many :item
  has_ancestry
end
