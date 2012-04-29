class Aspect < ActiveRecord::Base
	belongs_to :user
	has_many :aspect_memberships
	has_many :people, :through => :aspect_memberships
	has_many :aspect_visibilities
	has_many :posts, :through => :aspect_visibilities
	validates :name, :length => { :in => 3..20 }, :presence =>true
	
end
