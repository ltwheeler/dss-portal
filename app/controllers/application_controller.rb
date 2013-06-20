class ApplicationController < ActionController::Base
	before_filter CASClient::Frameworks::Rails::Filter
	before_filter :set_current_user
	protect_from_forgery
  
  def welcome
    unless session[:cas_user].nil?
	  redirect_to :controller => 'site', :action => 'index'
    end

  end
  
def logout
    logger.info "#{session[:cas_user]}@#{request.remote_ip}: Logged out."
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
	def set_current_user
		Authorization.current_user = Person.find(session[:cas_user])
		@current_user = Authorization.current_user
		logger.info "#{session[:cas_user]}@#{request.remote_ip}: Set current user to #{Authorization.current_user.inspect}."
	end
	
	#creates a hash of all apps sorted alphabetically (display name, id, class)
	#TODO_need to update this function to filter out apps that are favorites for the current user 
	def app_list
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
		apps = apps.sort{|a,b| a[:name].downcase<=>b[:name].downcase}
	end
	
	# def current_user
	#   Authorization.current_user
	# end  
end
