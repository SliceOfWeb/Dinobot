class ImagesController < ApplicationController
	before_filter :authenticate_user

	def new
		@image = Image.new
	end

	def create
		@image = Image.create params[:image]
		redirect_to album_path(@image.album_id)
	end
end
