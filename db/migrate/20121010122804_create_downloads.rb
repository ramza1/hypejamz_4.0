class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.string :ip
      t.decimal :hjc

      t.timestamps
    end
    add_index :downloads, :user_id
    add_index :downloads, :song_id
  end
end
