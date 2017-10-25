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
		@friends = User.where.not(id: Friendship.where("user_id = #{current_user["id"]}").pluck(:friend_id)).where.not(id: current_user["id"])
	end

	def create
		current_user = User.find(session[:current_user]["id"])	
		@message = current_user.messages.create(message_params)

		if @message
			@message.update_attribute(:isread, true)
			flash[:success] = "Sent message to #{@message.user.name}."
			redirect_to messages_path
		else
			flash[:error] = "Cannot send message."
			render 'new'
		end

	end
	
	private
		def message_params
			params.permit(:receiver, :text)
		end
end
