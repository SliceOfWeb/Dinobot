class ConversationsController < ApplicationController
	before_filter :authenticate_user

	def index
		@conversations = []
		Conversation.all.each do |conversation|
			if conversation.people.find_by_user_id(@current_user) && conversation.conversation_statuses.find_by_person_id(@current_person).visibility
				@conversations << conversation
			end
		end

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

			@conversation = Conversation.create({subject: params[:subject]})	

			@sender = ConversationStatus.create({person_id:@current_user.id, conversation_id: @conversation.id, unread: false, visibility: true })

			#in case to allow sending for more than one, make an array of receivers, and loop over it
			@receiver = ConversationStatus.create({person_id: receiver.id, conversation_id: @conversation.id, unread: true, visibility: true})

			@message = Message.create({conversation_id: @conversation.id, content: params[:content], person_id: @current_user.id, unread: true})
			redirect_to "/conversations/"
		end

	end

	def show
		@conversation = Conversation.find params[:id]
		@messages = @conversation.messages

		conversation_status = @conversation.conversation_statuses.find_by_person_id @current_person

		if conversation_status.unread
			conversation_status.update_attribute :unread, false
		end


=begin
		last_message = @messages.last
		if last_message.person != @current_person
			last_message.update_attribute :unread, false
		end
=end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		conversation = Conversation.find params[:id]
		
		conv_status_d = conversation.conversation_statuses.find_by_person_id @current_person

		conv_status_d.update_attribute :visibility, false

		redirect_to "/conversations/"
	end

end

