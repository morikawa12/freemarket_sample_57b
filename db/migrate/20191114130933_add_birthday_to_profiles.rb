class AddBirthdayToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :birthday, :integer
  end
end
