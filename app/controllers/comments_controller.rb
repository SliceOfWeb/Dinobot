class CommentsController < ApplicationController
	before_filter :authenticate_user


	def create
			@comment = Comment.new(params[:comment])
			@comment.person_id = User.find(session[:user_id]).person.id
			@comment.post_id= params[:post_id]
    	if @comment.save
      		# redirect_to(:controller => 'access', :action => 'login')
      		# render text: "you created comment by #{@comment.person.user.username}"
      		redirect_to :controller => 'posts' , :action => 'new'
    	else
      		render text: "Something worng happen while Commenting"
      end
	end
end
