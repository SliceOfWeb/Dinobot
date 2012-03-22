class ProfilesController < ApplicationController
	before_filter :authenticate_user
	
	def show
		@profile = Profile.find_by_user_id @current_user.id	

	end

	def index
		
	end

	def new
		@profile = Profile.new
	end


	def update
		@profile = Profile.find_by_user_id @current_user.id
		@profile.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :location => params[:location], :birthdate => params[:birthdate], :bio => params[:bio], :gender =>params[:gender], :education => params[:education])
		tags = params[:tags].split('/')
		

		# add new tags
		tags.each do |tag|
			unless Tag.find_by_text tag
				new_tag = Tag.create :text => tag
				@profile.tags << new_tag
			else
				exist_tag = Tag.find_by_text tag
				@profile.tags << exist_tag unless @profile.tags.include? exist_tag
			end	
		end

		# remove old tag
		@profile.tags.each do |tag|
			unless tags.include? tag.text
				@profile.tags.delete tag
			end
		end

		@tags = []
		@profile.tags.each do |tag|
			@tags << tag.text
		end
		
		# change email
		@current_user.email = params[:email]

		if @profile.save && @current_user.save
			
			flash[:notice] = "Your changes have been saved"

			redirect_to('/profiles/edit')	
		else

			render 'edit'
		end

	end

	def edit

		@profile = Profile.find_by_user_id @current_user.id

		@tags = []
		@profile.tags.each do |tag|
			@tags << tag.text
		end
		
	end

end
