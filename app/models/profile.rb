class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, :through => :taggings
	has_attached_file :photo, :styles => { :small => "150x150>" }
	validates :first_name, :length => { :in => 3..20}, :presence =>true
	validates :last_name, :length => { :in => 3..20 }, :presence =>true

end
