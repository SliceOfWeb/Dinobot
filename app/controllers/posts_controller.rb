class PostsController < ApplicationController
	before_filter :authenticate_user
end
