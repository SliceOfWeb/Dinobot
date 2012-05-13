class ActionsController < ApplicationController
	before_filter :authenticate_user


	def like
		@action = Action.find(params[:id])
		@action.people << @current_person
		if @action.save && params[:target_person_id] != @current_person.id.to_s
		 Notification.create(:target_type => 'Action',
          :target_url => "/#{@action.target_type}s/show/#{@action.target_id}", 
          :person_id => params[:target_person_id],
          :notifier_id => @current_person.id)
		end
		redirect_to :back
	end

	def unlike
		@action = Action.find(params[:id])
		@action.people.delete(@current_person) 
		@action.save
		redirect_to :back
	end
end
