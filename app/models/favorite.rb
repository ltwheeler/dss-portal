class Favorite < ActiveRecord::Base
  attr_accessible :app_id, :position, :loginid, :is_bookmark, :name
  validates :position, :presence => true
  #validates :loginid, :presence => true
end
