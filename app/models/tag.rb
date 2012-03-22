class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :profiles, :through => :taggings 
	validates :text, :length => { :in => 3..15 }, :uniqueness => true
end
