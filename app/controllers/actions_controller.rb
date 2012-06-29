class ActionsController < ApplicationController
	before_filter :authenticate_user


	def like
		@action = Action.find(params[:id])

		unless @action.people.include?(@current_person)
			@action.people << @current_person
		end

		respond_to do |format|
			if @action.save
				if params[:target_person_id] != @current_person.id.to_s
				 	Notification.create(:target_type => 'Action',
				 	:target_id => @action.id,
		          	:target_url => "/#{@action.target_type}s/show/#{@action.target_id}", 
		          	:person_id => params[:target_person_id],
		          	:notifier_id => @current_person.id)
				end
				format.html { redirect_to :back, notice: 'Action was successfully created.' }
          		format.js { render 'actions/create.js.erb' }
 
			else
			end
		end
	end

	def unlike
		@action = Action.find(params[:id])
		@action.people.delete(@current_person) 
		respond_to do |format|
			if @action.save
				format.html { redirect_to :back, notice: 'Action was successfully deleted.' }
	          	format.js { render 'actions/create.js.erb' }
	        else
	        end
        end
	end
end
