class UpdateUsersPermalink < ActiveRecord::Migration
  def change
   User.reset_column_information
   User.all.each { |f| f.update_attributes! :permalink => f.name.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '_') }
  end
end
