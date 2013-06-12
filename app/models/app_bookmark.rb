class AppBookmark < ActiveRecord::Base
  attr_accessible :description, :name, :url, :icon
  has_attached_file :icon
end
