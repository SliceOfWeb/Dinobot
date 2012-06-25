class PostsController < ApplicationController
	before_filter :authenticate_user
	
	def create
		@post = Post.new(params[:post])
		@post.post_type= "status"
		@post.person_id = @current_person.id
		#@post.aspects << Aspect.find_by_name("#{params[:aspect_name]}")
		@post.aspects << @current_user.aspects.find_by_name("#{params[:aspect_name]}")
    	if @post.save
    		Action.create(:target_type => 'Post', :target_id => @post.id)
      		redirect_to :back
    	else
      		render text: "Something worng happen while posting"
      end
	end


	def show
		@post= Post.find params[:id]
	end

	def destroy
		post_d = Post.find params[:id]
		
		post_d.comments.each do |c|
			c.destroy
		end
		post_d.destroy

		redirect_to :back
		
	end
end
