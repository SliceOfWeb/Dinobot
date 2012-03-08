class Contact < ActiveRecord::Base
	belongs_to :user
	has_many :aspect_memberships
	has_many :aspects, :through => :aspect_memberships
end
