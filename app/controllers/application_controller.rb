class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def current_user 
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def session_info
		@user_email ||= current_user[:email] ? current_user[:email] : ''
	end

	helper_method :current_user
	helper_method :session_info

	def authenticate_user!
		redirect_to '/login' unless current_user
	end
end
