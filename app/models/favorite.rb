class Favorite < ActiveRecord::Base
  attr_accessible :AppBookmark_id, :position, :loginid
  validates :position, :presence => true
  validates :AppBookmark_id, :presence => true
  #validates :loginid, :presence => true
end
