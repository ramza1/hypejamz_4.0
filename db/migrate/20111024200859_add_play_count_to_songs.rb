class AddPlayCountToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :play_count, :integer, :default => 0
    add_column :songs, :download_count, :integer, :default => 0
    add_column :songs, :countdown_score, :integer, :default => 0
    add_column :songs, :genre, :string
  end
end
