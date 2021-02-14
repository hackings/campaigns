class ApplicationController < ActionController::Base

	before_action :authenticate_user!
	helper_method :current_user

 
end
