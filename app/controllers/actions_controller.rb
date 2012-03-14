class ActionsController < ApplicationController
	before_filter :authenticate_user
end
