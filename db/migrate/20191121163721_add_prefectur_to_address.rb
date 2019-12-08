class AddPrefecturToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture, :integer
  end
end
