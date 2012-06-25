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
      if @current_user.person
        @notifications_counter= notifications
      end

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

=begin 
      @current_user.aspects[0].people.each do |person|
        person.posts.each do |post|
          @posts << post
        end
      end

=end
=begin
      @current_user.aspects[0].people.each do |person|
        person.user.aspects.each do |aspect| 

          #if aspect.name != "MyAspects"
            if aspect.people.include? Person.find(@current_person.id)
              aspect.posts.each { |post| @posts << post }
            end
          #end
          
        end
      end  
=end
  
    # add the public user posts
    @current_user.aspects[0].people.each do |person|
          person.aspects[0].posts.each { |post| @posts << post }
    end  

    # add private posts, if exsit
    @current_user.aspects[0].people.each do |person|
          #person.aspects[0].posts.each { |post| @posts << post }
          person.aspects.each do |aspect|
            if aspect.people.include? @current_person
              aspect.posts.each { |post| @posts << post }
            end
          end
    end  


    @current_user.person.posts.each do |post|
      @posts << post
    end
    @posts.sort! { |p|  p.created_at.to_i }

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

  def notifications  
    counter = 0
    @current_person.notifications.all.each do |notification|
      if notification.read == false
        counter+=1
      end
    end
   counter   
  end

end
