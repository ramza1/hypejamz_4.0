class CreateMusicGenres < ActiveRecord::Migration
  def change
    create_table :music_genres do |t|
      t.belongs_to :song
      t.belongs_to :genre

      t.timestamps
    end
    add_index :music_genres, :song_id
    add_index :music_genres, :genre_id
  end
end
