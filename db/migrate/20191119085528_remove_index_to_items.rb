class RemoveIndexToItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :shipping, foreign_key: true
  end
end
