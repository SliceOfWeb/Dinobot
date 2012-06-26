class VideosController < ApplicationController
	before_filter :authenticate_user
  def index
  	@person = User.find_by_username(params[:profile_id]).person
	@videos= @person.videos
  end

  def show
  	@video= Video.find params[:id]
  end

  def new
  	@video= Video.new
  end

  def create
  	@video= Video.new params[:video]
	@video.person = @current_person
	parts =params[:link].split('.')
	if parts[0] == "http://www" || parts[0] == "www" || parts[0] == "youtube"
			embeds = params[:link].split('=')
			embeds = embeds[1].split('&')
			@video.link = "http://www.youtube.com/embed/#{embeds[0]}"
		if @video.save
      		Action.create(:target_type => 'video', :target_id => @video.id)
      		redirect_to profile_video_path(@video.person.user.username,@video)
      	else
      		render text: "Something worng happen while Creating New Video"
      	end
    else
      	render text: "Sorry! But Link is Wrong"
    end
  end
end
