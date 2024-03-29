class Flag < ActiveRecord::Base
  include FlagThis::Flag
  this_is_a_flag
  
  belongs_to :flaggable, :polymorphic => true, :counter_cache => true
  # Flags belong to a user
  belongs_to :user
  
end
