class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans, force:true do |t|
      t.string :name
      t.decimal :dollar_price,      :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.decimal :naira_price,      :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.integer :hjc

      t.timestamps
    end
  end
end
