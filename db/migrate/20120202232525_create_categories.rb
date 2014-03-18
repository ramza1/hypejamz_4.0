class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :story

      t.timestamps
    end
    Category.create(:name => "Music")
    Category.create(:name => "Entertainment")
    add_index :categories, :story_id
  end
end
