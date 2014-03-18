class AddYesCountToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :yes_count, :integer, :default => 0
    add_column :songs, :no_count, :integer, :default => 0
    add_column :songs, :replies_count, :integer, :default => 0
  end
end
