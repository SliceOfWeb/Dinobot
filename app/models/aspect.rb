class Aspect < ActiveRecord::Base
	belongs_to :user
	has_many :aspect_memberships
	has_many :contacts, :through => :aspect_memberships
	has_many :aspect_visibilities
	has_many :posts, :through => :aspect_visibilities
end
