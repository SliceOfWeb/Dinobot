class UsersController < ApplicationController

  before_filter :save_login_state
  layout false
  #Signup Form
  def new
    @user = User.new 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
        session[:user_id] = @user.id
    		redirect_to new_profile_path
  	else
        flash[:notice] = "Form is invalid!"
    		render "new"
    end
  end
end
