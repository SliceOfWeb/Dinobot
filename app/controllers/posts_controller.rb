class PostsController < ApplicationController
	before_filter :authenticate_user
	
	def create
		@post = Post.new(params[:post])
		if params[:uploaded_photo] 	#In Case User Upload a Photo
			@image = Image.new :caption => @post.content, :album_id => @current_person.albums[0], :location => 'Home' 
			@image.image = params[:uploaded_photo]
			if @current_person.albums[0].images[0] == @image
				@current_person.albums[0].cover_url = @image.image.url
			end
			if @image.save
      			Action.create(:target_type => 'Image', :target_id => @image.id)
      			@post.post_type= "photo"
      			@post.photo_url = @image.image.url
    		else
      			
      		end
		elsif @post.video_url &&  @post.video_url != ""
			parts = @post.video_url.split('.')
			if parts[0] == "http://www" || parts[0] == "www" || parts[0] == "youtube" #In Case User copy video address
				@post.post_type= "video"
				embeds = @post.video_url.split('=')
				embeds = embeds[1].split('&')
				@post.video_url = "http://www.youtube.com/embed/#{embeds[0]}"
				@video = Video.create :person_id => @current_person, :title =>"Stream Post", :link => @post.video_url
				Action.create(:target_type => 'video', :target_id => @video.id)
			else
				
			end
		else
			@post.post_type= "status"  #In Case User just write a status
		end
		@post.person_id = @current_person.id
		@post.aspects << @current_user.aspects.find_by_name("#{params[:aspect_name]}")
    	respond_to do |format|
	    	if @post.save
	    		Action.create(:target_type => 'Post', :target_id => @post.id)
	        	format.html { redirect_to :back, notice: 'Post was successfully created.' }
	       		format.js   			
	    	else
	      			
	      	end
      	end
	end


	def show
		@post= Post.find params[:id]
		if [:photo_url]
			p= @current_person
			p.albums[0].images.each do |image|
				if image.image.url == params[:photo_url]
					target_photo = image
					redirect_to profile_album_image_path(p.user.username,image.album, image)
				end
			end
		end
	end

	def destroy
		post_d = Post.find params[:id]
		
		post_d.comments.each do |c|
			c.destroy
		end
		post_d.destroy

		respond_to do |format|  
      		format.html { redirect_to :back }  
     		format.js   { render :nothing => true }  
   		end 
			
	end

end
