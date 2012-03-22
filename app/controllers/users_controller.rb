class UsersController < ApplicationController

	layout false
  before_filter :save_login_state

  #Signup Form
  def new
    @user = User.new 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
    		redirect_to(:controller => 'profile', :action => 'new')
  	else
    		render "new"
    end
  end
end
