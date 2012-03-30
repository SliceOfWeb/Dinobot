class PostsController < ApplicationController
	before_filter :authenticate_user

	def create
			@post = Post.new(params[:post])
			@post.post_type= "status"
			@post.person_id = @current_user.person.id
    	if @post.save
    		Action.create(:target_type => 'post', :target_id => @post.id, :upvote_count => 0)
      		redirect_to home_path
    	else
      		render text: "Something worng happen while posting"
      end
	end
end
