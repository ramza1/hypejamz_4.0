class AddReleasedDateToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :released_date, :date

  end
end
