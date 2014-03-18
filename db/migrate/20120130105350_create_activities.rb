class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.boolean :public
      t.integer :item_id
      t.string :item_type

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :item_id
    add_index :activities, :item_type
  end
end
