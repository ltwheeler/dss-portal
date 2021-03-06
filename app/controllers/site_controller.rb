class SiteController < ApplicationController

	def index
	#creates a hash of all apps sorted alphabetically (display name, id, class)
	#TODO_need to update this function to filter out apps that are favorites for the current user 
		rm_apps = @current_user.accessible_applications

		bookmark_apps = AppBookmark.all		

		apps = Array.new
		app = Hash.new
		#collect list of RM apps
		rm_apps.each do |rm|		
			apps << { :name => rm.application_name, :id => rm.id, :class => "rm"}
		end

		#collect list of bookmark apps
		bookmark_apps.each do |book|
			apps << { :name => book.name, :id => book.id, :class => "book"}
		end
		#alphabatizes the array of hashes by 'name'
		@apps = apps.sort{|a,b| a[:name].downcase<=>b[:name].downcase}
		


		@favorites = Favorite.find_all_by_loginid(@current_user.loginid, :order => 'position')
	end
	
	
end
