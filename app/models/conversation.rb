class Conversation < ActiveRecord::Base
	has_many :messages
	belongs_to :reciver , :class_name => 'User', #:foreign_key => reciver_id
	belongs_to :sender ,  :class_name => 'User', #:foreign_key => sender_id	
end
