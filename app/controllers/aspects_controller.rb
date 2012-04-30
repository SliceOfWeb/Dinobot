class AspectsController < ApplicationController
	before_filter :authenticate_user

	def index
	end

	def new
		@aspect= Aspect.new
	end

	def create
		@aspect = Aspect.new :name => params[:aspect][:name]
		if params[:aspect][:hidden] == "True"
			@aspect.hidden = true
		end
		@aspect.user = @current_user
		@aspect.save

		redirect_to aspects_path
		
	end

	def add
		@aspect= Aspect.find params[:id]
		p = Person.find params[:person_id]
		unless @aspect == @current_user.aspects[0]
		 	@aspect.people << p
		end
		@current_user.aspects[0].people << p
		redirect_to people_path
	end
end
