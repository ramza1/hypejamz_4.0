class AddAllowCommentsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :allow_comments, :boolean, :default => true
    add_column :notes, :fans_only, :boolean, :default => true
  end
end
