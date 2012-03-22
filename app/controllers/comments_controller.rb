class CommentsController < ApplicationController
	before_filter :authenticate_user


	def create
			@comment = Comment.new({:content => params[:content] ,:post_id => params[:post_id]})
			@comment.person_id = User.find(session[:user_id]).person.id
    	if @comment.save
      		# redirect_to(:controller => 'access', :action => 'login')
      		# render text: "you created comment by #{@comment.person.user.username}"
      		redirect_to '/home'
    	else
      		render text: "Something worng happen while Commenting"
      end
	end
end
