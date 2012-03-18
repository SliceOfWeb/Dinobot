class PeopleController < ApplicationController
	before_filter :authenticate_user

	def home
		@post = Post.new
		@posts = Post.order("posts.created_at DESC")
	end
end
