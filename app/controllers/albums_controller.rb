class AlbumsController < ApplicationController
	before_filter :authenticate_user

	def index
		@person = User.find_by_username(params[:profile_id]).person
		@albums= @person.albums
		
	end

	def new
		@album= Album.new
	end

	def create
		@album= Album.create params[:album]
		@album.person = @current_person
		if @album.save
      		Action.create(:target_type => 'Album', :target_id => @album.id)
      		redirect_to profile_album_path(@album.person.user.username,@album)
    	else
      		render text: "Something worng happen while Creating New Album"
      	end
		
	end

	def show
		@album= Album.find params[:id]
	end
end
