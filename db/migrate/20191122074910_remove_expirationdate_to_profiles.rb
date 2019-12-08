class RemoveExpirationdateToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :expiration_year, :integer
    remove_column :profiles, :expiration_month, :integer
  end
end
