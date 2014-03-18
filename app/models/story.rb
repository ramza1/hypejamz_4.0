class Story < ActiveRecord::Base
  belongs_to :category
  has_attached_file :clip,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_clip_file_name",
                    :styles => {:small => '309x160#', :big => '600x345>', :small_100 => "100x100#"},
                    :url => "/system/:attachment/:id/:style/:normalized_clip_file_name"
  validates_attachment_content_type :clip, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :clip, :less_than => 1.megabyte
   has_many :comments, :as => :commentable, :order => "created_at asc"
  belongs_to :user
  #scope :not_included, lambda { |song| where("song_id NOT IN (?)", song)}

  Paperclip.interpolates :normalized_clip_file_name do |attachment, style|
    attachment.instance.normalized_clip_file_name
  end

  def normalized_clip_file_name
    "#{self.clip_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end


  def self.primitive_search(query, join = "AND")
    find(:all, :conditions => primitive_search_conditions(query, join))
  end

  def similar_stories
      self.class.limit(5).primitive_search(title, "OR")
  end

def next_story
  self.class.find(:first,
    :conditions => ['id > ?', self.id],
    :order => 'id')
end

def previous
  self.class.find(:first,
    :conditions => ['id < ?', self.id],
    :order => 'id desc')
end


  private

  def self.primitive_search_conditions(query, join)
    query.split(/\s+/).map do |word|
      '(' + %w[title].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} ")
  end




end
