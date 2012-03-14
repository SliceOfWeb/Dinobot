class ConversationsController < ApplicationController
	before_filter :authenticate_user
end

