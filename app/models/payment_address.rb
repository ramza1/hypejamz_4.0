class PaymentAddress < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :alternate_phone_number, :country, :phone_number, :state, :zip

  validates :address, :phone_number, :country, :state, :user_id, :zip, :presence => true
  validates :user_id, :uniqueness => true

  before_create :create_verification_code

  def create_verification_code
    self.verification_code = SecureRandom.hex(2)
  end
end
