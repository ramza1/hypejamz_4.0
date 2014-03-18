class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.boolean :active, :default => false
      t.string :site_url
      t.string :image_url
      t.boolean :force_top, :default => false

      t.timestamps
    end
  end
end
