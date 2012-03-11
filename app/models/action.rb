class Action < ActiveRecord::Base
	belongs_to :post
	has_many :action_items
	has_many :people, :through => :action_items
	
end
