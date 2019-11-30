class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :product_status, :string
  end
end
