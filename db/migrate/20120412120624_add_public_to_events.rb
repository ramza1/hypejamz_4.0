class AddPublicToEvents < ActiveRecord::Migration
  def change
    add_column :events, :public, :boolean

    add_column :events, :start_time, :datetime

    add_column :events, :end_time, :datetime

    add_column :events, :reminder, :boolean

    add_column :events, :event_attendees_count, :integer, :default => 0

    add_column :events, :privacy, :integer

  end
end
