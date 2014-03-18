class ChangeColumnPriceToPrice < ActiveRecord::Migration
  def change
    change_column :albums, :price, :decimal, :default => nil

  end
end
