class UsersController < ApplicationController
	
	def new
	end

	def index
		@users = User.where("id != #{current_user["id"]}")
	end


	def show
		@user = User.find(current_user["id"])
	end

	def create
		user = User.create(user_params)

		if user
			flash[:success] = "Register successfully."
			redirect_to messages_path 
		else
			flash[:error] = "Cannot create new account."
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
