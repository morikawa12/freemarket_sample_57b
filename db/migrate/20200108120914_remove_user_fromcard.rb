class RemoveUserFromcard < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :security_code, :string
    remove_column :profiles, :card_number, :string
    remove_column :profiles, :expiration_date, :string
  end
end
