class SendMessagesController < ApplicationController
  
	def index
 		user_id = session[:current_user]["id"]
		@messages = Message.where("user_id = #{user_id}").order("created_at DESC")
	end
end
