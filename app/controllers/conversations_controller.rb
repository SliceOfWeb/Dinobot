class ConversationsController < ApplicationController
	before_filter :authenticate_user

	def index
		@conversations = Conversation.all		
	end

	def new
		@conversation = Conversation.new
		@message = Message.new
	end

	def create
		
		receiver = User.find_by_username params[:friends][:username].downcase

		if params[:content] == ""
			flash[:no_content] = "Cannot send empty message"
			render "/conversations/new/"
		else
			@conversation = Conversation.create({ sender_id: @current_user.id, receiver_id: receiver.id, subject: params[:subject]})	

			@message = Message.create({conversation_id: @conversation.id, content: params[:content], person_id: @current_user.id, unread: true})
			redirect_to conversations_path
		end

	end

	def show
		@conversation = Conversation.find params[:id]
		@messages = @conversation.messages

		last_message = @messages.last
		if last_message.person != @current_person
			last_message.update_attribute :unread, false
		end
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		conversation_d = Conversation.find params[:id]
		
		conversation_d.messages.each do |m|
			m.destroy
		end

		conversation_d.destroy

		redirect_to "/conversations/"
	end

end

