class AddApprovedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :approved, :boolean, :default => false
  end
end
