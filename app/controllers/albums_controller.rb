class AlbumsController < ApplicationController
	before_filter :authenticate_user

	def index
		@albums= @current_user.person.albums.all
	end

	def new
		@album= Album.new
	end

	def create
		@album= Album.create params[:album]
		@album.person = @current_person
		@album.save
		redirect_to albums_path
	end

	def show
		@album= Album.find params[:id]
	end
end
