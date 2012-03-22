class HomeController < ApplicationController
  before_filter :authenticate_user

  def index
	@post = Post.new
	@posts = Post.order("posts.created_at DESC")
  end
end
