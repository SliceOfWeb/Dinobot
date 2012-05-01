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
		@p = Person.find params[:person_id]
		unless @aspect == @current_user.aspects[0]
		 	@aspect.people << @p
		end
		unless @current_user.aspects[0].people.find_by_id(@p.id) 
			@current_user.aspects[0].people << @p
		end
		redirect_to :back
	end

	def remove
		@aspect= Aspect.find params[:id]
		@p = Person.find params[:person_id]
		@aspect.people.delete(@p)

		@current_user.aspects.each do |aspect|
			next if aspect.name == 'MyAspects'
			aspect.people.each do |member|
				if member == @p
					redirect_to :back
					return
				end
			end
		end
		@current_user.aspects[0].people.delete(@p)
		redirect_to :back
	end
end
