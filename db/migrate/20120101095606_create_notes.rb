class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body, :limit => 300
      t.belongs_to :user
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
