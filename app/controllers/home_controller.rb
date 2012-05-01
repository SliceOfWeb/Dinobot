class HomeController < ApplicationController
  before_filter :authenticate_user
  def index
  	get_posts
  end
end
