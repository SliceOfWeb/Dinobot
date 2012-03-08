class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :profiles, :through => :taggings 
end
