class SiteController < ApplicationController

	def index
		@current_user = current_user
		@apps = Application.all
    		@favorites = Favorite.all
	end
	
end
