class WithdrawalRequest < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true, :uniqueness => true
  # attr_accessible :title, :body
end
