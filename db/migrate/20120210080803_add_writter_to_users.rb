class AddWritterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :writter, :boolean, :default => false
  end
end
