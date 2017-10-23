class FriendshipsController < ApplicationController

	def create
		user = User.find(current_user["id"])
		@friendship = user.friendships.create(user_id: user.id, friend_id: params[:friend_id])

		if @friendship 
			flash[:success] = "Added friend."
			redirect_to users_path
		else
			flash[:error] = "Unable to add friend."
			redirect_to messages_path
		end

	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		redirect_to user_path(current_user["id"]) 
	end

	private
	def friendship_params
		params.require(:friendship).permit(:user_id, :friend_id)
	end
end
