class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
  	unless session[:user_id]
  		redirect_to login_path
  		return false
  	else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
      @post = Post.new
      @posts = Post.order("posts.created_at DESC")
      
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
end
