class SiteController < ApplicationController

	def index
		@apps = Application.all
		@favorites = Favorite.find(:all, :conditions => ["loginid=?", @current_user.loginid], :order => 'position' )
	end
	
end
