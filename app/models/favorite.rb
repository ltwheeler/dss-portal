class Favorite < ActiveRecord::Base
  attr_accessible :AppBookmark_id, :order
  validates :order, :presence => true
  validates :AppBookmark_id, :presence => true
end
