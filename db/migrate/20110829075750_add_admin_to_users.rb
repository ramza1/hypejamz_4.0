class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :permalink, :string
    add_column :users, :real_name, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :provider, :string
    User.create!(:name => "hypejamz", :real_name => "hypejamz", :email => "hypejamz@yahoo.com", :password => "uuuuuu", :admin => true)
  end
end
