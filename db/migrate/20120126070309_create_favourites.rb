class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :liked_song_id

      t.timestamps
    end
    add_index :favourites, :user_id
    add_index :favourites, :liked_song_id
  end
end
