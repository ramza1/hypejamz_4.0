class AddPremiumUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_user, :boolean, :default => false
    add_column :users, :gold_user, :boolean, :default => false
    add_column :users, :account_balance, :decimal, :default => 0
  end
end
