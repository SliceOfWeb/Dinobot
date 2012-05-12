class CommentsController < ApplicationController
	before_filter :authenticate_user


	def create
			@comment = Comment.new({:content => params[:content] ,:commentary_id => params[:commentary_id], :commentary_type => params[:commentary_type] })
			@comment.person_id = User.find(session[:user_id]).person.id
    	if @comment.save
      		Action.create(:target_type => 'comment', :target_id => @comment.id, :upvote_count => 0)
      		redirect_to :back
    	else
      		render text: "Something worng happen while Commenting"
      end
	end

  def destroy

    comment_d = Comment.find params[:id]
    
    comment_d.destroy

    redirect_to :back
  end

end
