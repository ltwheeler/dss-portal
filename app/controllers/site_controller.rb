class SiteController < ApplicationController
	def index
	@current_user = current_user
	@apps = Application.all
	end

end
