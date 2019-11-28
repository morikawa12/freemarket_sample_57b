class RemoveDetailsddBirthdayToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :birthday, :integer
  end
end