class AddAboutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :twitter_username, :string
    add_column :users, :facebook_username, :string
  end
end
