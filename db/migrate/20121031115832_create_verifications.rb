class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :verifications, :user_id
  end
end
