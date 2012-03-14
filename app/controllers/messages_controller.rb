class MessagesController < ApplicationController
	before_filter :authenticate_user
end
