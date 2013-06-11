class Favorite < ActiveRecord::Base
  attr_accessible :app_id, :position, :loginid, :is_bookmark
  validates :position, :presence => true
  #validates :loginid, :presence => true
end
