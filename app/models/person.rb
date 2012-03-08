class Person < ActiveRecord::Base
	belongs_to :user
	has_many :posts
	has_many :messages
	has_many :conversations 
	has_many :invitations
	has_many :mentions
	has_many :group_memberships
	has_many :groups, :through => :group_memberships
	has_many :group_admins
	has_many :groups, :through => :group_admins
	has_many :notification_items
	has_many :notifications, :through => :notification_items
	has_many :action_items
	has_many :actions, :through => :action_items
	has_many :comments
end
