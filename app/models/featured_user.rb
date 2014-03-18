class FeaturedUser < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => {:thumb => "75x350#"}, :default_url => 'icon_:style.png'
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :image, :less_than => 1.megabyte

  validates :user_id, :start, :end, :presence => true
  scope :random_users, :order => "RAND()", :limit => 8
  scope :mobile_users, :order => "RAND()", :limit => 20
  validates_uniqueness_of :user_id

  def user_name
    user.try(:name)
  end

  def user_name=(name)
    self.user = User.find_by_name(name) if name.present?
  end


end
