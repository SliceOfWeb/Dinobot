class ActionsController < ApplicationController
	before_filter :authenticate_user


	def update
		@action = Action.find(params[:id])
		@action.upvote_count = @action.upvote_count + 1
		@action.save
		redirect_to :back
	end
end
