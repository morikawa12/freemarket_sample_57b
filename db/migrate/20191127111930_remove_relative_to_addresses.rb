class RemoveRelativeToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :relative_family_name, :integer
    remove_column :addresses, :relative_first_name, :integer
    remove_column :addresses, :relative_family_name_kana, :integer
    remove_column :addresses, :relative_first_name_kana, :integer
  end
end
