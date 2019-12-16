class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,                 null: false, index: true
      t.integer :price,  null: false
      t.text    :description,            null: false
      t.integer :status,              null: false
      t.integer :prefecture,              null: false
      t.integer :fee,              null: false
      t.integer :size,              null: false
      t.integer :shipping,            null: false
      t.integer :arrival,              null: false
      t.integer :like,              null: false
      t.timestamps
    end
  end
end
