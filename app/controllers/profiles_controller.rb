class ProfilesController < ApplicationController
	before_filter :authenticate_user
	
	def index
		@profile = Profile.find_by_user_id @current_user.id
	end

	def save_changes

		@profile = Profile.find_by_user_id @current_user.id
		if @profile
			@profile.update_attributes(params[:profile])
			redirect_to(:controller => 'profiles', :action => 'index')	
		else
			@profile = Profile.new params[:profile]
			@profile.user = @current_user
			if @profile.save
				redirect_to(:controller => 'profiles', :action => 'index')
			else
			render 'edit'
			end
		end

	end

	def edit
		@profile = Profile.find_by_user_id @current_user.id

		unless @profile
			@profile = Profile.new
		else
			@profile
		end
	end

end
