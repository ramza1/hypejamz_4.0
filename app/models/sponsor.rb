class Sponsor < ActiveRecord::Base
  scope :active, where("active = ?", true)
  scope :side_ads, :conditions => {:force_top => true}, :order => ("RAND()"), :limit => 1
  scope :header_ad, :conditions => {:header_position => true}, :order => ("RAND()"), :limit => 1
  scope :top_ad, where("top_ad = ?", true)


  has_attached_file :ad, :styles => {:small_30 => "74x42#", :big => "263x205#", :wide => "460x80#", :flat => "637x90#"}
  validates_attachment_content_type :ad, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :ad, :less_than => 3.megabytes

  def position
    if force_top?
      rand
    else
      rand + 1
    end
  end

end
