class AddDownloadCountToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :download_count, :integer, :default => 0

  end
end
