class Category < ActiveRecord::Base
  has_many :stories
  attr_accessible :name
end
