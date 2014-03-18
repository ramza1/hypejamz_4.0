class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :name
      t.string :email
      t.text :body
      t.integer :receiver_id
      t.boolean :read,         :default => false, :null => false

      t.timestamps
    end
    add_index 'messages', 'receiver_id'
  end
end
