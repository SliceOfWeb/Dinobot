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

	def destroy
		post_d = Post.find params[:id]
		post_d.comments.each do |c|
			c.destroy
		end
		post_d.destroy

		redirect_to "/home"
	end
end
