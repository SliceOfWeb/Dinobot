class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
  	unless session[:user_id]
  		redirect_to(:controller => 'access', :action => 'new')
  		return false
  	else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
      
  		return true
  	end
  end

  #This method for prevent user to access Signup & Welcome & Login Page without logout
  def save_login_state
    if session[:user_id]
      redirect_to :home
      return false
    else
      return true
    end
  end
end
