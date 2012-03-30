class SessionsController < ApplicationController

	layout false
	before_filter :authenticate_user, :except => [:index, :new, :create, :destroy]
	before_filter :save_login_state, :only => [:index, :new, :create]


	def index
		#Welcome Page
	end 

	def new
		#Login Form	
	end


	def create
		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			# redirect to User home page 
			redirect_to home_path

		else
			flash[:notice] = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to welcome_path
	end

end
