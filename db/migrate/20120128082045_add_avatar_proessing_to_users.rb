class AddAvatarProessingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :icon_processing, :boolean
  end
end
