class Post < ActiveRecord::Base
	has_one :action
	belongs_to :person
	belongs_to :group
	has_many :comments
	has_many :aspect_visibilities
	has_many :aspects, :through => :aspect_visibilities
	has_many :mentions

	validates :post_type, :inclusion => { :in => %w(status video photo link)}
	validates :url_title, :length => { :maximum => 255 }
	validates :content, :length => { :maximum => 500 }	
	
	

	#validates :video_url, :format => { :with => /\A[a-zA-Z]+\z/ }
	#validates :link_url, :format => { :with => /\A[a-zA-Z]+\z/ }
	#validates :photo_url, :format => { :with => /\A[a-zA-Z]+\z/ }
end

