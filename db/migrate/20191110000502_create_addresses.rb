class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :relative_family_name, null: false
      t.string :relative_first_name, null: false
      t.string :relative_family_name_kana, null: false
      t.string :relative_first_name_kana, null: false
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building, null: false
      t.string :home_phone, null: false
      # t.references :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
