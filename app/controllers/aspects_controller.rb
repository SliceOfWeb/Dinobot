class AspectsController < ApplicationController
	before_filter :authenticate_user
end
