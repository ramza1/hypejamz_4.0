class AddSenderToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender_id, :integer
    add_index 'messages', 'sender_id'
  end
end
