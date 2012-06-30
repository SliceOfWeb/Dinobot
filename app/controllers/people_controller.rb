class PeopleController < ApplicationController
	before_filter :authenticate_user

	def show
		@profiles = []
		unless params[:user_q] == ""
			@profiles = Profile.find_all_by_first_name(params[:user_q])
			Profile.find_all_by_last_name(params[:user_q]).each do |p|
				@profiles << p
			end
		else
			Profile.all.each do |p|  
				unless p == @current_profile
					@profiles << p		
				end
			end
		end
	end


end	
