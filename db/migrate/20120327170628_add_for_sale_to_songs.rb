class AddForSaleToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :for_sale, :boolean, :default => false

  end
end
