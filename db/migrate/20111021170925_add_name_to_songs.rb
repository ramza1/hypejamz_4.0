class AddNameToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :name, :string
    remove_column :songs, :title
  end
end
