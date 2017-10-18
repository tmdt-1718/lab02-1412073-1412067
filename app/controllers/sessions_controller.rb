class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(session_params)

		if user.nil?
			flash[:error] = "Wrong email or password."
			render new
		else
			session[:current_user] = user
			flash[:success] = "Login successfully."
			redirect_to root_path 
		end
	end

	def delete
	end

	private
		def session_params
			params.require(:session).permit(:email, :password)
		end
end
