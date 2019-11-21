class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|

      t.string :size
      t.references :category, foreign_key: true


      t.timestamps
    end
  end
end
