class AccessController < ApplicationController

	layout false
	before_filter :authenticate_user, :except => [:index, :login, :signing, :logout]
	before_filter :save_login_state, :only => [:index, :login, :signing]
	
	def index
		#Welcome Page
	end 

	def login
		authorized_user = User.authenticate(params[:username],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			# redirect to User home page 
			redirect_to('/profiles/update')

		else
			flash[:notice] = "Invalid email or password"
			render "login"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'index'
	end

end
