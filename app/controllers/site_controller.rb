class SiteController < ApplicationController

	def index
		@current_user = current_user
		@apps = Application.all
    		@favorites = Favorite.find(:all, :order => 'position')
	end
	
end
