class AddExpirationDateToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :expiration_date, :string
  end
end
