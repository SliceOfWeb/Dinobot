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
		redirect_to album_path(@image.album_id)
	end

	def show
		@image = Image.find params[:id]
	end
end
