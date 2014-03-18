class AddHeaderPositionToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :header_position, :boolean, :default => false
  end
end
