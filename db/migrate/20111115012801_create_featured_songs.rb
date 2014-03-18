class CreateFeaturedSongs < ActiveRecord::Migration
  def change
    create_table :featured_songs do |t|
      t.integer :song_id
      t.integer :position
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
