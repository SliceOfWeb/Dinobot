class Message < ActiveRecord::Base
	belongs_to :conversation
	belongs_to :person
	validates :content, :length => { :in => 1..300 }	
end
