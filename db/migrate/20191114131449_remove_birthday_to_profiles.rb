class RemoveBirthdayToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :birth_year, :integer
    remove_column :profiles, :birth_month, :integer
    remove_column :profiles, :birth_day, :integer
  end
end
