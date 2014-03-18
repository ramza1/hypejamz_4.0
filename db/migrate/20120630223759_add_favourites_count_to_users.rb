class AddFavouritesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favourites_count, :integer, :default => 0
  end
end
