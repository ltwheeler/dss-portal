class SiteController < ApplicationController

	def index
		@apps = Application.all
		@favorites = Favorite.find_all_by_loginid(@current_user.loginid, :order => 'position')
	end
	
end
