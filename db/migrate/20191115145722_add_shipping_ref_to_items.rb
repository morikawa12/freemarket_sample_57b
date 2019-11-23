class AddShippingRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :shipping, foreign_key: true, index: true
  end
end
