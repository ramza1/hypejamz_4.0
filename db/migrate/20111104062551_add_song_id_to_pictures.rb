class AddSongIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :song_id, :integer
  end
end
