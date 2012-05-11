class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, :through => :taggings
	has_attached_file :photo
	validates :first_name, :length => { :in => 3..20}, :presence =>true
	validates :last_name, :length => { :in => 3..20 }, :presence =>true

end
