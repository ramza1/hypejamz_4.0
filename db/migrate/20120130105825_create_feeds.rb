class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.belongs_to :user
      t.belongs_to :activity

      t.timestamps
    end
    add_index :feeds, :user_id
    add_index :feeds, :activity_id
    add_index :feeds, [:user_id, :activity_id]
  end
end
