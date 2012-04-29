class PeopleController < ApplicationController
	before_filter :authenticate_user

	def index
		@people = Person.all
	end
end	
