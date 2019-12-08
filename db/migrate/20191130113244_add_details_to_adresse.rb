class AddDetailsToAdresse < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture, :string
  end
end
