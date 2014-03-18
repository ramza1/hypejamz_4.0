class AddTopAdToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :top_ad, :boolean, :default => false
  end
end
