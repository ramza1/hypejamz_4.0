class Song < ActiveRecord::Base
  include ActivityLogger
  belongs_to :user, :counter_cache => true
  is_impressionable
  can_be_flagged :after_add => :flagged
  scope :global_songs, where("approved = (?)", true).order("created_at desc").limit(6)
  attr_accessible :title, :album, :description, :price, :approved, :mp3, :art, :genre_ids
  validates_presence_of :title
  has_many :music_genres
  has_many :genres, :through => :music_genres
  validates_attachment_presence :mp3
  make_flaggable :report
  has_attached_file :mp3,
    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_mp3_file_name",
    :url => "/system/:attachment/:id/:style/:normalized_mp3_file_name"
  validates_attachment_content_type :mp3, :content_type => ['audio/mp3', 'audio/mpeg', 'audio/mid', 'audio/x-wav']
  has_attached_file :art,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_art_file_name",
                    :styles => {:small => '100x100#', :big => '60x60#'}, :default_url   => "/assets/missing_:style.png",
                    :url => "/system/:attachment/:id/:style/:normalized_art_file_name"
  validates_attachment_content_type :art, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :art, :less_than => 1.megabyte
  validates_attachment_size :mp3, :less_than => 5.megabyte
  validates_inclusion_of :price, :in => %w( 2 10 20 30 40 50 55 60 70 75 80 90 100 99 ), :message => "extension %{value} is not included in the list", :allow_nil => true
  scope :countdowns, :order => "countdown_score desc", :limit => 40
  scope :front_countdowns, :order => "countdown_score desc", :limit => 3
  scope :top_downloads, :order => "downloads_count desc", :limit => 40
  scope :front_downloads, :order => "downloads_count desc", :limit => 3
  after_create :notifier_followers
  scope :other_songs, lambda { |song|  where("id NOT IN (?)", song)}
  has_many :featured_songs, :dependent => :destroy
  has_many :comments, :as => :commentable, :order => "created_at asc"
  scope :most_recent, order: "created_at desc", limit: 5
  scope :approved, where("approved = (?) OR yes_count >= (?)", true, 50 ).order("created_at desc")
  scope :not_approved, where("approved = (?)", false).order("created_at desc")
  has_many :replies
  after_create :log_activity, :set_permalink
  ajaxful_rateable :stars => 5, :dimension => [:poor, :good, :excellent], :cache_column => :rating_average
  has_many :yes_responses, :class_name => "Reply", :conditions => ['yes = TRUE']
  has_many :no_responses, :class_name => "Reply", :conditions => ['yes = FALSE']
  has_many :replies, :dependent => :destroy
  has_many :downloads, :dependent => :destroy
  has_many :trends
  has_many :rates, as: :rateable

  Paperclip.interpolates :normalized_mp3_file_name do |attachment, style|
    attachment.instance.normalized_mp3_file_name
  end

  Paperclip.interpolates :normalized_art_file_name do |attachment, style|
    attachment.instance.normalized_art_file_name
  end

  def to_param
    [id, permalink].compact.join('-')
  end


  def set_permalink
    self.permalink = title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-')
  end

  def voted_by?(user)
    replies.exists?(:user_id => user)
  end

  scope :like, lambda { |*args|
    query = args.flatten.first
    where("name like ?", "%#{query}%")
  }

  scope :team, lambda { |*args|
    query = args.flatten.first
    where("title like ?", "%#{query}%")
  }

  def normalized_mp3_file_name
    "#{self.mp3_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end

  def normalized_art_file_name
    "#{self.art_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end

  def flagged
    if self.flags_count > 250
      self.destroy
    end
  end

  def download
    self.increment!(:download_count, 1)
  end

  def played
    self.increment!(:play_count, 1)
  end

  def notifier_followers
    followers = (user.friends_of)
    followers.each do |user|
      NoteUpdate.update_song_followers(user, self).deliver
    end
  end

  def make_download(ip, hjc, user)
    downloads.create({:ip => ip, :hjc => hjc, :user_id => user}, :as => :admin)
  end

  def make_trend(ip)
    trend = trends.new({:ip => ip}, :as => :admin)
    if trend.valid?
      trend.save
    else
      logger.debug "Trend has been created"
    end
  end
    # Return the percentage of responses that are yes.  Output is a whole integer.
  def percentage_yes
    return 0 if yes_count == 0

    ((yes_count.to_f / replies_count) * 100).to_i
  end

  # Return the percentage of responses that are no.  Output is a whole integer.
  def percentage_no
    return 0 if no_count == 0

    100 - percentage_yes
  end

  # Return a chart showing the yes/no breakdown of responses
  def chart_responses
    Gchart.bar(:data => [percentage_yes, percentage_no],:size => "400x150", :labels => ["#{percentage_yes}% Love", "#{percentage_no}% Hate"])
  end

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end

  def countdown(score)
    update_trending_score(score)
  end

  private
  def update_trending_score(impression)
    self.update_attribute(:countdown_score, impression)
  end


end
