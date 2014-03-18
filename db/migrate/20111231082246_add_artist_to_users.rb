class AddArtistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artist, :boolean, :default => false
  end
end
