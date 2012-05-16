class NotificationsController < ApplicationController
	before_filter :authenticate_user

	def index
		@notifications = @current_person.notifications.order
		@notifications.sort! { |n|  n.created_at.to_i }
	end

	def show
		@notification= Notification.find params[:id]
		@notification.read= true
		@notification.save
		redirect_to @notification.target_url

	end
end
