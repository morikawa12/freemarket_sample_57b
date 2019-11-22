class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :shipping, null: false

      t.timestamps
    end
  end
end
