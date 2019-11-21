class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.string :family_name, null: false 
      t.string :first_name, null: false 
      t.string :family_name_kana, null: false 
      t.string :first_name_kana, null: false 
      t.integer :birth_year, null: false 
      t.integer :birth_month, null: false 
      t.integer :birth_day, null: false 
      t.string :mobile_phone, null: false 
      t.string :profile_image, null: true 
      t.text :profile_content, null: true 
      t.string :card_number, null: true 
      t.string :expiration_month, null: true 
      t.string :expiration_year, null: true 
      t.string :security_code, null: true 
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
