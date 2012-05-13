class CommentsController < ApplicationController
	before_filter :authenticate_user


	def create
			@comment = Comment.new({:content => params[:content] ,:commentary_id => params[:commentary_id], :commentary_type => params[:commentary_type] })
			@comment.person_id = @current_person.id
    	if @comment.save
      	Action.create(:target_type => 'comment', :target_id => @comment.id)
      	if params[:person_id] != @comment.person_id.to_s
          Notification.create(:target_type => 'Comment',
          :target_id => @comment.id,
          :target_url => "/comments/show/#{@comment.id}", 
          :person_id => params[:person_id],
          :notifier_id => @comment.person_id)
        end
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

  def show
    @comment = Comment.find params[:id]
    if @comment.commentary_type == "Post"
      @post= @comment.commentary
      redirect_to "/posts/show/#{@post.id}/##{@comment.id}"
    end 
  end

end
