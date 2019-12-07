class ChangeDataCoulumnsToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status, :string
    change_column :items, :prefecture, :string
    change_column :items, :fee, :string
    change_column :items, :arrival, :string
  end
end
