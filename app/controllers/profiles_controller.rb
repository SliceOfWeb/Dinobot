class ProfilesController < ApplicationController
	before_filter :authenticate_user
	
	def index
		@profile = Profile.find_by_user_id @current_user.id
	end

	def save_changes

		@profile = Profile.find_by_user_id @current_user.id
		if @profile
			@profile.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :location => params[:location], :birthdate => params[:birthdate], :bio => params[:bio])
			tags = params[:tags].split ", and "
			@profile.tags = []
			tags.each do |t|
				# fix uniquness
				tag = Tag.create :text => t
				@profile.tags << tag
			end
			@profile.save!

			@current_user.email = params[:email]
			@current_user.save!

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
			unless @profile.tags.empty?
				@tags = []
				Profile.first.tags.each do |tag| @tags << tag.text end
			else
				@tags = []
			end

		end

		
	end

end
