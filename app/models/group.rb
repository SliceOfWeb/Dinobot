class Group < ActiveRecord::Base
	has_many :posts
	has_many :group_admins
	has_many :people, :through => :group_admins
	has_many :group_memberships
	has_many :people, :through => :group_memberships
end
