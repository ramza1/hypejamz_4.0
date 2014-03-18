class AddDeurationToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :duration, :time
  end
end
