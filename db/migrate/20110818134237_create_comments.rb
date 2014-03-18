class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text     "comment"
      t.datetime "created_at",                          :null => false
      t.datetime "updated_at",                          :null => false
      t.integer  "user_id"
      t.string   "commentable_type", :default => "",    :null => false
      t.integer  "commentable_id",                      :null => false
      t.timestamps
    end
  end
end
