class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
  	unless session[:user_id]
  		redirect_to(:controller => 'access', :action => 'login')
  		return false
  	else
  		return true
  	end
  end

  #This method for prevent user to access Signup & Welcome & Login Page without logout
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'people', :action => 'home_layout')
      return false
    else
      return true
    end
  end
end
