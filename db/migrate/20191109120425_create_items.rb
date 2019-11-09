class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,                 null: false, index: true
      t.integer :price,  null: false
      t.text    :description,            null: false
      t.integer  :status,              null: false
      t.integer  :prefecture,              null: false
      t.integer  :fee,              null: false
      t.integer :size,              null: false
      t.integer  :shipping,            null: false
      t.integer  :arrival,              null: false
      t.integer  :like,              null: false
      t.references  :brand_id,      null: false, foreign_key: true
      t.references  :size_id,      null: false, foreign_key: true
      t.references :first_category_id,      null: false, foreign_key: true
      t.references :second_category_id,      null: false, foreign_key: true
      t.references :third_category_id,      null: false, foreign_key: true
      t.references :sales_condition,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
