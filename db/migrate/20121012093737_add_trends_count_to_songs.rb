class AddTrendsCountToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :trends_count, :integer, :default => 0
  end
end
