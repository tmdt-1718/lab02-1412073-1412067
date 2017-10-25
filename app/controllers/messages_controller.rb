class MessagesController < ApplicationController
	before_action :authenticate
	def index
		filter_send = params[:send]

		if filter_send.nil?
			#filter_send = null => receiver = current_user 
			@messages = Message.where("receiver = #{current_user["id"]}").order("created_at DESC")
		else
			@messages = Message.where("user_id = #{current_user["id"]}").order("created_at DESC")
		end
	end

	def show
		@message = Message.find(params[:id])

		if !@message.isread
			Time.zone = 'Hanoi'
			@message.update_attribute(:time_read, Time.current)
			@message.update_attribute(:isread, true)
		end
	end

	def new
		@message = Message.new
		@friends = User.where(id: Friendship.where("user_id = #{current_user["id"]}").pluck(:friend_id))
	end

	def create
		current_user = User.find(session[:current_user]["id"])	
		@message = current_user.messages.new(message_params)
		if @message.save
			flash[:success] = "Sent message to #{User.find(@message.receiver).name}."
			redirect_to messages_path
		else
			flash[:error] = "Cannot send message."
			render 'new'
		end

	end
	
	private
		def message_params
			params.require(:message).permit(:receiver, :text, :image)
		end
end
