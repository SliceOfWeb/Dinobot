class Comment < ActiveRecord::Base
	has_one :action, :as => :target
	belongs_to :commentary, :polymorphic => true
	belongs_to :person
	validates :content, :length => { :maximum => 300 }, :presence =>true	
end
