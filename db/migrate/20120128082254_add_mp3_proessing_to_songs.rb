class AddMp3ProessingToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :mp3_processing, :boolean
    add_column :songs, :art_processing, :boolean
  end
end
