class Feed < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
end