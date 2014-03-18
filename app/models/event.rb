class Event < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_attached_file :event, :styles => {:big => '100x100#', :small => '60x60#'}
  validates_attachment_content_type :event, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  scope :other_events, lambda { |event|  where("id NOT IN (?)", event)}
  has_many :comments, :as => :commentable, :order => "created_at asc"
end

