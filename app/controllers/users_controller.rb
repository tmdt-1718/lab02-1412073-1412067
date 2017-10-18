class UsersController < ApplicationController
	
	def new
	end

	def create
		user = User.create(user_params)

		if user
			flash[:success] = "Register successfully."
			redirect_to messages_path 
		else
			flash[:error] = "Cannot create new account."
			render new
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
