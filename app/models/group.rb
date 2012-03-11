class Group < ActiveRecord::Base
	has_many :posts
	has_many :group_admins
	has_many :people, :through => :group_admins
	has_many :group_memberships
	has_many :people, :through => :group_memberships
	validates :name, :length => { :in => 3..40 }	
	validates :description, :length => { :in => 0..1000 }	
end
