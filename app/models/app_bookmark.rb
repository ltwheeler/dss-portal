class AppBookmark < ActiveRecord::Base
  attr_accessible :description, :name, :uid, :url
end
