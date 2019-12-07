class RemoveBuildingToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :building, :integer
    remove_column :addresses, :home_phone, :integer
  end
end
