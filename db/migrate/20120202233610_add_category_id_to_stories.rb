class AddCategoryIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :category_id, :integer
  end
end
