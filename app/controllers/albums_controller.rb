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
		if @album.save
      		Action.create(:target_type => 'Album', :target_id => @album.id, :upvote_count => 0)
      		redirect_to albums_path
    	else
      		render text: "Something worng happen while Creating New Album"
      	end
		
	end

	def show
		@album= Album.find params[:id]
	end
end
