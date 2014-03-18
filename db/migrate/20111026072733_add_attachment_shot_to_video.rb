class AddAttachmentShotToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :shot_file_name, :string
    add_column :videos, :shot_content_type, :string
    add_column :videos, :shot_file_size, :integer
    add_column :videos, :shot_updated_at, :datetime
  end

  def self.down
    remove_column :videos, :shot_file_name
    remove_column :videos, :shot_content_type
    remove_column :videos, :shot_file_size
    remove_column :videos, :shot_updated_at
  end
end
