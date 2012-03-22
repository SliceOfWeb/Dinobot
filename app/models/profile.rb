class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, :through => :taggings
	validates :first_name, :length => { :in => 3..20}, :presence =>true
	validates :last_name, :length => { :in => 3..20 }, :presence =>true
	

	def to_param
		user_id		
	end


	
end
