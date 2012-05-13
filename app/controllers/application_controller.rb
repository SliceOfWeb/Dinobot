class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
  	unless session[:user_id]
  		redirect_to login_path
  		return false
  	else

      # set globals varibales by the current user object 
      @current_user = User.find session[:user_id]
      @current_profile = @current_user.profile 
      @current_person = @current_user.person
      @conver_counter = messages_notification
      

  		return true
  	end
  end

  #This method for prevent user to access Signup & Welcome & Login Page without logout
  def save_login_state
    if session[:user_id]
      redirect_to home_path
      return false
    else
      return true
    end
  end

  def get_posts
    @post = Post.new
      @posts = []
      @current_user.aspects[0].people.each do |person|
        person.posts.each do |post|
          @posts << post
        end
      end
      @current_user.person.posts.each do |post|
        @posts << post
      end
      @posts.reverse!
  end

  def messages_notification
    
    conversation_counter = 0

    Conversation.all.each do |conversation|
      if conversation.people.find_by_user_id(@current_user) && conversation.conversation_statuses.find_by_person_id(@current_person).visibility
        conv_status = conversation.conversation_statuses.find_by_person_id @current_person.id
        if conv_status.unread       
          conversation_counter += 1
        end
      end
    end
    
    conversation_counter
    
  end

end
