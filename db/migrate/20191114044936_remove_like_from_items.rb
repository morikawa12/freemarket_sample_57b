class RemoveLikeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :like, :integer
  end
end
