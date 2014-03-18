class AddAttachmentEveToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :eve_file_name, :string
    add_column :events, :eve_content_type, :string
    add_column :events, :eve_file_size, :integer
    add_column :events, :eve_updated_at, :datetime
  end

  def self.down
    remove_column :events, :eve_file_name
    remove_column :events, :eve_content_type
    remove_column :events, :eve_file_size
    remove_column :events, :eve_updated_at
  end
end
