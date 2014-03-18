class Video < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, :order => "created_at asc"
  has_attached_file :shot, :styles => {:small => '100x100#'}
  validates_attachment_content_type :shot, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :shot, :less_than => 1.megabyte
  scope :completes,   where(:is_complete => true).order("created_at desc")
  scope :completes_video,   where(:is_complete => true).order("created_at desc")
  scope :incompletes, where(:is_complete => false)
  scope :other_videos, lambda { |video|  where("id NOT IN (?)", video)}

  scope :like, lambda { |*args|
    query = args.flatten.first
    where("title like ?", "%#{query}%")
  }
  ajaxful_rateable :stars => 5, :dimension => [:poor, :good, :excellent]
  attr_accessible :title, :description, :is_complete, :yt_video_id, :user_id
  after_create :set_permalink

  def create_comment(comment)
    begin
      comments.create(:comment => comment)
      Video.yt_session.add_comment(yt_video_id, comment)
    rescue
      false
    end
  end

  def to_param
    [id, permalink].compact.join('-')
  end


  def set_permalink
    self.permalink = title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-')
  end



  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)
  end

  def self.delete_video(video)
    yt_session.video_delete(video.yt_video_id)
    video.destroy
  rescue
    video.destroy
  end

  def self.update_video(video, params)
    yt_session.video_update(video.yt_video_id, video_options(params))
    video.update_attributes(params)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.delete_incomplete_videos
    self.incompletes.map{|r| r.destroy}
  end

  private
  def self.video_options(params)
    opts = {:title => params[:title],
            :description => params[:description],
            :category => "People",
            :keywords => ["test"]}
    params[:is_unpublished] == "1" ? opts.merge(:private => "true") : opts
  end
end