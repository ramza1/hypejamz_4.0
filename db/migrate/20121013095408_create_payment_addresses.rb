class CreatePaymentAddresses < ActiveRecord::Migration
  def change
    create_table :payment_addresses do |t|
      t.belongs_to :user
      t.string :address
      t.string :state
      t.string :country
      t.string :zip
      t.string :phone_number
      t.string :alternate_phone_number
      t.boolean :verified, :default => false
      t.string :verification_code, :null => false, :unique => true

      t.timestamps
    end
    add_column :users, :payment_address_id, :integer
    add_index :payment_addresses, :user_id
    add_index :users, :payment_address_id
  end
end
