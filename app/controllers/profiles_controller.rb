class ProfilesController < ApplicationController
	before_filter :authenticate_user
	
	def show
		@profile = Profile.find_by_user_id User.find_by_username params[:username]	
		if @profile
			#render "show"

			respond_to do |format|
				format.html
				format.json { render :json => @profile, :status => 200 }
			end

		else
			render text: "this page dose not exist"
		end
	end

	def index

	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.create(params[:profile])
		@profile.user = @current_user
		# colleting tag
		tags = params[:tags].split(' ')

		tags.each do |tag|
			unless Tag.find_by_text tag
				new_tag = Tag.create :text => tag
				@profile.tags << new_tag
			else
				exist_tag = Tag.find_by_text tag
				@profile.tags << exist_tag unless @profile.tags.include? exist_tag
			end	
		end

		if @profile.save
			@person= Person.create :profile_link => "/#{@current_user.username}", :user_id => @current_user.id
			@mydefaultaspect= Aspect.new :name => "MyAspects"
			@mydefaultaspect.user= @current_user
			@mydefaultaspect.save

			@album= Album.create :title => "Stream Posts"
			@album.person = @person
			if @album.save
      			Action.create(:target_type => 'Album', :target_id => @album.id)
      		end


			redirect_to home_path	
			
		else

			render 'new'
		end

	end

	def edit

		@profile = Profile.find_by_user_id @current_user.id

		@tags = []
		@profile.tags.each do |tag|
			@tags << tag.text
		end
		
	end
	
	def update
		@profile = Profile.find_by_user_id @current_user.id
		@profile.update_attributes(params[:profile])

		@current_user.update_attributes(:email =>params[:email])

		tags = params[:tags].split(' ')
		
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

			redirect_to("/#{@current_user.username}")	
		else

			render 'edit'
		end

	end

	def account_setting
		
	end


	def save
		# render json: params.to_json
		if params[:setting] == "account"
			
			if @current_user.username != params[:username] || @current_user.email != params[:email]
				@current_user.update_attributes!({ username: params[:username], email: params[:email] })
			end

			if params[:old_password] != "password" && params[:new_password].length >= 6
				old_pass = BCrypt::Engine.hash_secret params[:old_password], @current_user.salt
				if old_pass == @current_user.hashed_password
					@current_user.salt = BCrypt::Engine.generate_salt
      				@current_user.hashed_password = BCrypt::Engine.hash_secret(params[:new_password], @current_user.salt)
      				@current_user.save!
				end
			end
		end			
		
		redirect_to :back

	end
end
