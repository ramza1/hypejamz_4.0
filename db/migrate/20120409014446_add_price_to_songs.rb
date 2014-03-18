class AddPriceToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :price, :string

  end
end
