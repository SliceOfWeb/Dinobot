class UsersController < ApplicationController
	  before_filter :authenticate_user!
	def index 
		render "users/sessions/new"
	end

end
