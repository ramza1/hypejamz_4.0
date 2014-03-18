class Album < ActiveRecord::Base
  scope :approved, where("approved = (?)", true).order("created_at desc")
  has_attached_file :album_art,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_album_art_file_name",
                    :styles => {:small => '100x100#', :big => '60x60#'}, :default_url   => "/assets/missing_:style.png",
                    :url => "/system/:attachment/:id/:style/:normalized_album_art_file_name"
  validates_attachment_content_type :album_art, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  belongs_to :user
  validates :name, :about, :presence => true
  validates_attachment_presence :album_art
  validates_inclusion_of :price, :in => 0..1500, :allow_nil => true
  has_attached_file :file
  validates_attachment_content_type :album_art, :content_type => ['file/tar', 'file/zip', 'file/rar']
  validates_attachment_presence :file
  has_many :comments, :as => :commentable, :order => "created_at asc"

  Paperclip.interpolates :normalized_album_art_file_name do |attachment, style|
    attachment.instance.normalized_album_art_file_name
  end

  def normalized_album_art_file_name
    "#{self.album_art_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end

  def download
    self.increment!(:download_count, 1)
  end

  scope :like, lambda { |*args|
    query = args.flatten.first
    where("name like ?", "%#{query}%")
  }
end
