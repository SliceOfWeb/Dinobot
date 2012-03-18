class PostsController < ApplicationController
	before_filter :authenticate_user


	def create
			@post = Post.new(params[:post])
			@post.post_type= "status"
			@post.person_id = User.find(session[:user_id]).person.id
    	if @post.save
      		# redirect_to(:controller => 'access', :action => 'login')
      		# render text: "you created post by #{@post.person.user.username}"
      		redirect_to :controller =>'people', :action => 'home'
    	else
      		render text: "Something worng happen while posting"
      end
	end
end
