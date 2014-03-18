class Download < ActiveRecord::Base
  belongs_to :user
  belongs_to :song, :counter_cache => true
  attr_accessible :hjc, :ip, :user_id, as: :admin
end
