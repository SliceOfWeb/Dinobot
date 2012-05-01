class MessagesController < ApplicationController
	before_filter :authenticate_user

	def create
		if params[:content] == ""
			flash[:no_content] = "Cannot send empty message"
			redirect_to "/conversations/" + params[:conversation_id]
		else
			@message = Message.create({conversation_id: params[:conversation_id], content: params[:content], person_id: @current_user.id, unread: true})
			redirect_to "/conversations/"+ params[:conversation_id]
		end
		
	end

	

end
