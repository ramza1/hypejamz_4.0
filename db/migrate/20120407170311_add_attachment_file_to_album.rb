class AddAttachmentFileToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :file_file_name, :string
    add_column :albums, :file_content_type, :string
    add_column :albums, :file_file_size, :integer
    add_column :albums, :file_updated_at, :datetime
  end

  def self.down
    remove_column :albums, :file_file_name
    remove_column :albums, :file_content_type
    remove_column :albums, :file_file_size
    remove_column :albums, :file_updated_at
  end
end
