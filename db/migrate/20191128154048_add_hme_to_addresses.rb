class AddHmeToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :building, :string
    add_column :addresses, :home_phone, :string
  end
end
