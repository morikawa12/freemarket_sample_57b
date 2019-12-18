class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :users
    remove_index :items, :user_id
    remove_reference :items, :user
  end
end
