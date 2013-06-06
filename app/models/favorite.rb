class Favorite < ActiveRecord::Base
  attr_accessible :AppBookmark_id, :position
  validates :position, :presence => true
  validates :AppBookmark_id, :presence => true
end
