class ImagesController < ApplicationController
	before_filter :authenticate_user

	def new
		@image = Image.new
	end

	def create
		@image = Image.create params[:image]
		@album = Album.find(@image.album_id)
		if @album.images[0] == @image
			@album.cover_url = @image.image.url
		end
		if @image.save
      		Action.create(:target_type => 'Image', :target_id => @image.id, :upvote_count => 0)
      		redirect_to album_path(@image.album_id)
    	else
      		render text: "Something worng happen while Uploading"
      	end
		
	end

	def show
		@image = Image.find params[:id]
		@Image_owner= @image.album.person.user.profile
	end
end
