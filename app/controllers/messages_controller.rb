class MessagesController < ApplicationController
	before_action :authenticate
	def index
		user_id = session[:current_user]["id"];
		@messages = Message.where("receiver = #{user_id}").order("created_at DESC")
	end

	def show
	end

	def new
		@message = Message.new
	end

	def create
		#check if receiver exist or not
		current_user = User.find(session[:current_user]["id"])	
		@message = current_user.messages.create(message_params)
		redirect_to messages_path
	end
	
	private
		def message_params
			params.require(:message).permit(:receiver, :text)
		end
end
