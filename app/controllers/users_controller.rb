class UsersController < ApplicationController

	layout false
  before_filter :save_login_state

  def index
    render 'new'
	end

    def new
      #Signup Form
      @user = User.new 
    end

   def create
    	@user = User.new(params[:user])
    	if @user.save
      		redirect_to(:controller => 'access', :action => 'login')
    	else
      		render "new"
      end
    end
end
