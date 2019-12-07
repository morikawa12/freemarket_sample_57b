class RemoveCoulmnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping, :integer
    remove_column :items, :size, :integer
  end
end
