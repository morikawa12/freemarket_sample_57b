class AddAncestryToShipping < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :ancestry, :string
    add_index :shippings, :ancestry
  end
end
