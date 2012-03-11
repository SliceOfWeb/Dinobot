class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :person
	validates :content, :length => { :maximum => 300 }	
end
