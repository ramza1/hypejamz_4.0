class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :yt_video_id
      t.boolean :is_complete, :default => false
      t.integer :user_id
      t.timestamps
    end
    add_index :videos, :user_id
  end
end
