class CreateWithdrawalRequests < ActiveRecord::Migration
  def change
    create_table :withdrawal_requests do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :withdrawal_requests, :user_id
  end
end
