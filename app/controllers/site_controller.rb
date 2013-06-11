class SiteController < ApplicationController

	def index
		@apps = Application.all
		@favorites = Favorite.find(:all, :order => 'position')
	end
	
end
