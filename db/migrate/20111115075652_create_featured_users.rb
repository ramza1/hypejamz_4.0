class CreateFeaturedUsers < ActiveRecord::Migration
  def change
    create_table :featured_users, force: true do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
    add_index :featured_users, :user_id
  end
end
