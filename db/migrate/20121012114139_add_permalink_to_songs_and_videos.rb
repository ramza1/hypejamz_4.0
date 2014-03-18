class AddPermalinkToSongsAndVideos < ActiveRecord::Migration
  def change
    add_column :songs, :permalink, :string
    add_column :videos, :permalink, :string
  end
end
