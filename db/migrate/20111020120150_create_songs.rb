class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
    add_index :songs, :user_id
  end
end
