class AddApprovedToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :approved, :boolean, :default => false

    add_column :albums, :for_sale, :boolean, :default => false

    add_column :albums, :price, :decimal, :default => 0
  end
end
