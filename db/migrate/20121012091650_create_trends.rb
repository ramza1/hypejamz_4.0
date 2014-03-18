class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :ip
      t.belongs_to :song

      t.timestamps
    end
    add_index :trends, :song_id
  end
end
