class AppBookmark < ActiveRecord::Base
  attr_accessible :description, :name, :uid, :url, :icon
  has_attached_file :icon
end
