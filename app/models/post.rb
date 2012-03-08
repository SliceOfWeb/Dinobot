class Post < ActiveRecord::Base
	has_one :social_impact
	belongs_to :person
	belongs_to :group
	has_many :comments
	has_many :aspect_visibilities
	has_many :aspects, :through => :aspect_visibilities
	has_many :mentions
end
