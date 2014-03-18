class AddPicturesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pictures_count, :integer, :default => 0
  end
end
