class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	def authenticate
		if session[:current_user].nil?
			redirect_to login_path
		end
	end

	def current_user
		return unless session[:current_user]
		@current_user ||= session[:current_user]
	end

end
