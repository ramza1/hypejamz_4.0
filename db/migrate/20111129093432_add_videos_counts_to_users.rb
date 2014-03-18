class AddVideosCountsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :videos_count, :integer, :default => 0
  end
end
