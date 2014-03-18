class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, :force => true do |t|
      t.belongs_to :user
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :events, :user_id
  end
end
