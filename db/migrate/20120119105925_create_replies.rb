class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.boolean :yes

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :song_id
  end
end
