class AddCommentsCountToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :comments_count, :integer, :default => 0
  end
end
