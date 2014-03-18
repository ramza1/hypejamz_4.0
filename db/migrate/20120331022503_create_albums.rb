class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.datetime :released_at
      t.text :about

      t.timestamps
    end
  end
end
